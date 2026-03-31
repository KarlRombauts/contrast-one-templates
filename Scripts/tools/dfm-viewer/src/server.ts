import express from 'express';
import { createServer } from 'http';
import { WebSocketServer } from 'ws';
import { watch } from 'chokidar';
import { readFileSync, statSync, existsSync } from 'fs';
import { resolve, basename, join } from 'path';
import { parseDfm } from './parser.js';
import { renderDfm } from './renderer.js';
import { formStyles } from './styles.js';
import { clientScript } from './client.js';

function buildPage(dfmPath: string): string {
  const dfmText = readFileSync(dfmPath, 'utf-8');
  const ast = parseDfm(dfmText);
  const formHtml = renderDfm(ast);
  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DFM Viewer — ${basename(dfmPath)}</title>
<style>${formStyles}</style>
</head>
<body>
${formHtml}
<script>${clientScript}</script>
</body>
</html>`;
}

function main() {
  const args = process.argv.slice(2);
  let port = 3000;
  let dfmPath: string | undefined;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--port' && args[i + 1]) {
      port = parseInt(args[i + 1], 10);
      i++;
    } else if (!args[i].startsWith('-')) {
      dfmPath = resolve(args[i]);
    }
  }

  if (!dfmPath) {
    console.error('Usage: dfm-viewer [--port PORT] <path-to-dfm-file-or-directory>');
    process.exit(1);
  }

  // If path is a directory, look for screen.dfm
  if (existsSync(dfmPath) && statSync(dfmPath).isDirectory()) {
    const candidate = join(dfmPath, 'screen.dfm');
    if (existsSync(candidate)) {
      dfmPath = candidate;
    } else {
      console.error(`No screen.dfm found in ${dfmPath}`);
      process.exit(1);
    }
  }

  if (!existsSync(dfmPath)) {
    console.error(`File not found: ${dfmPath}`);
    process.exit(1);
  }

  const app = express();
  const server = createServer(app);
  const wss = new WebSocketServer({ server, path: '/ws' });

  let cachedPage = buildPage(dfmPath);

  app.get('/', (_req, res) => {
    res.type('html').send(cachedPage);
  });

  // Watch the DFM file for changes
  const watcher = watch(dfmPath, { ignoreInitial: true });
  watcher.on('change', () => {
    try {
      cachedPage = buildPage(dfmPath!);
      console.log(`Reloaded ${basename(dfmPath!)}`);
      wss.clients.forEach(client => {
        if (client.readyState === 1) {
          client.send(JSON.stringify({ type: 'reload' }));
        }
      });
    } catch (err) {
      console.error('Error rebuilding:', err);
    }
  });

  // Try the requested port, fall back to next available
  server.on('error', (err: NodeJS.ErrnoException) => {
    if (err.code === 'EADDRINUSE') {
      console.log(`Port ${port} in use, trying ${port + 1}...`);
      port++;
      server.listen(port);
    }
  });

  server.listen(port, () => {
    console.log(`Serving ${basename(dfmPath!)} at http://localhost:${port}`);
    console.log('Watching for changes...');
  });

  // Graceful shutdown
  process.on('SIGINT', () => {
    watcher.close();
    wss.close();
    server.close();
    process.exit(0);
  });
}

main();
