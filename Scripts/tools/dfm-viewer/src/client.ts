export const clientScript = `
(function() {
  // === Tab Switching ===
  document.addEventListener('click', function(e) {
    var tab = e.target.closest('.dfm-tab');
    if (!tab) return;
    var pc = tab.dataset.pc;
    var tabName = tab.dataset.tab;
    // Deactivate all tabs in this page control
    document.querySelectorAll('.dfm-tab[data-pc="' + pc + '"]').forEach(function(t) {
      t.classList.remove('active');
    });
    document.querySelectorAll('.dfm-tab-panel[data-pc="' + pc + '"]').forEach(function(p) {
      p.classList.remove('active');
    });
    // Activate clicked tab
    tab.classList.add('active');
    var panel = document.querySelector('.dfm-tab-panel[data-panel="' + tabName + '"][data-pc="' + pc + '"]');
    if (panel) panel.classList.add('active');
    // Save tab state
    sessionStorage.setItem('dfm-tab:' + pc, tabName);
  });

  // === Check Combo Box ===
  document.addEventListener('click', function(e) {
    var ccb = e.target.closest('.dfm-check-combo');
    if (!ccb) return;
    var name = ccb.dataset.ccb;
    var dropdown = document.querySelector('[data-ccb-dropdown="' + name + '"]');
    if (dropdown) {
      dropdown.classList.toggle('open');
    }
  });

  // Close check combo dropdowns when clicking outside
  document.addEventListener('click', function(e) {
    if (!e.target.closest('.dfm-check-combo') && !e.target.closest('.dfm-check-combo-dropdown')) {
      document.querySelectorAll('.dfm-check-combo-dropdown.open').forEach(function(d) {
        d.classList.remove('open');
      });
    }
  });

  // Update check combo display text when checkboxes change
  document.addEventListener('change', function(e) {
    var checkbox = e.target;
    if (!checkbox.closest('.dfm-check-combo-dropdown')) return;
    var dropdown = checkbox.closest('.dfm-check-combo-dropdown');
    var name = dropdown.dataset.ccbDropdown;
    var display = document.querySelector('.dfm-check-combo[data-ccb="' + name + '"]');
    if (!display) return;
    var checked = dropdown.querySelectorAll('input:checked');
    if (checked.length === 0) {
      display.textContent = 'Click to select...';
    } else {
      var texts = [];
      checked.forEach(function(cb) { texts.push(cb.value); });
      display.textContent = texts.join(', ');
    }
    // Save state
    var state = [];
    dropdown.querySelectorAll('input[type="checkbox"]').forEach(function(cb) {
      state.push(cb.checked ? '1' : '0');
    });
    sessionStorage.setItem('dfm-state:' + name, state.join(','));
  });

  // === State Preservation ===

  // Save input values on change
  document.addEventListener('input', function(e) {
    var el = e.target;
    var name = el.dataset && el.dataset.name;
    if (!name) return;
    if (el.tagName === 'INPUT' || el.tagName === 'SELECT') {
      sessionStorage.setItem('dfm-state:' + name, el.value);
    }
  });
  document.addEventListener('change', function(e) {
    var el = e.target;
    var name = el.dataset && el.dataset.name;
    if (!name) return;
    if (el.tagName === 'SELECT') {
      sessionStorage.setItem('dfm-state:' + name, el.value);
    }
    if (el.type === 'checkbox' && el.closest('.dfm-checkbox')) {
      sessionStorage.setItem('dfm-state:' + name, el.checked ? '1' : '0');
    }
  });

  // Restore state on load
  function restoreState() {
    // Restore tab states
    document.querySelectorAll('.dfm-tabs').forEach(function(tabBar) {
      var pc = tabBar.dataset.pc;
      var saved = sessionStorage.getItem('dfm-tab:' + pc);
      if (!saved) return;
      tabBar.querySelectorAll('.dfm-tab').forEach(function(t) { t.classList.remove('active'); });
      var target = tabBar.querySelector('.dfm-tab[data-tab="' + saved + '"]');
      if (target) target.classList.add('active');
      var parent = tabBar.parentElement;
      if (parent) {
        parent.querySelectorAll(':scope > .dfm-tab-panel').forEach(function(p) { p.classList.remove('active'); });
        var panel = parent.querySelector('.dfm-tab-panel[data-panel="' + saved + '"]');
        if (panel) panel.classList.add('active');
      }
    });

    // Restore input values
    document.querySelectorAll('[data-name]').forEach(function(el) {
      var name = el.dataset.name;
      var saved = sessionStorage.getItem('dfm-state:' + name);
      if (saved === null) return;
      if (el.tagName === 'INPUT' && el.type !== 'checkbox') {
        el.value = saved;
      } else if (el.tagName === 'SELECT') {
        el.value = saved;
      } else if (el.type === 'checkbox' && el.closest('.dfm-checkbox')) {
        el.querySelector('input').checked = saved === '1';
      }
    });

    // Restore check combo states
    document.querySelectorAll('.dfm-check-combo-dropdown').forEach(function(dropdown) {
      var name = dropdown.dataset.ccbDropdown;
      var saved = sessionStorage.getItem('dfm-state:' + name);
      if (!saved) return;
      var states = saved.split(',');
      var checkboxes = dropdown.querySelectorAll('input[type="checkbox"]');
      states.forEach(function(s, i) {
        if (checkboxes[i]) checkboxes[i].checked = s === '1';
      });
      // Update display
      var display = document.querySelector('.dfm-check-combo[data-ccb="' + name + '"]');
      if (!display) return;
      var checked = dropdown.querySelectorAll('input:checked');
      if (checked.length === 0) {
        display.textContent = 'Click to select...';
      } else {
        var texts = [];
        checked.forEach(function(cb) { texts.push(cb.value); });
        display.textContent = texts.join(', ');
      }
    });
  }

  restoreState();

  // === WebSocket Hot Reload ===
  var protocol = location.protocol === 'https:' ? 'wss:' : 'ws:';
  var ws = new WebSocket(protocol + '//' + location.host + '/ws');
  ws.onmessage = function(event) {
    var msg = JSON.parse(event.data);
    if (msg.type === 'reload') {
      location.reload();
    }
  };
  ws.onclose = function() {
    // Reconnect after 2 seconds
    setTimeout(function() {
      location.reload();
    }, 2000);
  };
})();
`;
