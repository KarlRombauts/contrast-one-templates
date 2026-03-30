import re 
import sys

importedFiles = set()
defines = dict()
filePathRegex = "([\w\-\/\.]+\.\w+)"

def getDefineReplaceRegex():
    return "({{" + "}}|{{".join(defines.keys()) + "}})"


def registerDefines(line):
    result = re.search('^#define ([\w]+) (.+)$', line)

    if result is None:
        return line
    
    (key, value) = result.groups()
    defines[key] = value
    return ""


def replaceDefines(line):
    if len(defines) == 0:
        return line

    results = set(re.findall(getDefineReplaceRegex(), line)) 
    processedLine = line

    for result in results:
        key = result[2:-2] # strip the brackets {{ ... }} 
        processedLine = re.sub(result, defines[key], processedLine)

    return processedLine


def processIncludes(line):
    regex = '#include "' + filePathRegex + '"'

    result = re.search(regex, line) 
    if result is None:
        return line

    includeFilePath = result.group(1)
    fileContents = processFile(includeFilePath)
    return re.sub(regex, fileContents, line)    


def processImports(line):
    regex = '#import "' + filePathRegex + '"'

    result = re.search(regex, line) 
    if result is None:
        return line

    importFilePath = result.group(1)
    if importFilePath in importedFiles:
        return re.sub(regex, "", line)    

    fileContents = processFile(importFilePath)
    importedFiles.add(importFilePath)
    return re.sub(regex, fileContents, line)    


def processLine(line):

    newLine = line
    newLine = registerDefines(newLine)
    newLine = replaceDefines(newLine)
    newLine = processIncludes(newLine)
    newLine = processImports(newLine)

    if newLine != line and len(newLine.strip()) == 0:
        return None

    return newLine
    

def processFileLines(lines):
    for (index, line) in enumerate(lines):
        lines[index] = processLine(line)

    
    return "".join(filter(lambda x: x is not None, lines))


def getFileLines(path):
    with open(path) as f:
        lines = f.readlines()
    return lines


def processFile(path):
    return processFileLines(getFileLines(path))


if len(sys.argv) < 2:
    print("No input file specified")
    exit(2)

if len(sys.argv) < 3:
    print("No output file specified")
    exit(3)

inputFilePath = sys.argv[1]
outputFilePath = sys.argv[2]


with open(outputFilePath, "w") as text_file:
    text_file.write(processFile(inputFilePath))
