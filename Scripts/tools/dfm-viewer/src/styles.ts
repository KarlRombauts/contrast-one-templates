export const formStyles = `
/* === DFM Viewer — Windows Classic Form Theme === */
* { box-sizing: border-box; margin: 0; padding: 0; }

body {
  font-family: 'Segoe UI', Tahoma, sans-serif;
  font-size: 12px;
  background: #c0c0c0;
  padding: 20px;
}

.dfm-form {
  background: #ece9d8;
  border: 2px solid #999;
  border-radius: 4px;
  font-family: 'Segoe UI', Tahoma, sans-serif;
  font-size: 12px;
  box-shadow: 2px 2px 8px rgba(0,0,0,0.15);
  max-width: 1440px;
}

.dfm-titlebar {
  background: linear-gradient(180deg, #3a6ea5, #1e4d8c);
  color: white;
  padding: 3px 8px;
  font-size: 11px;
  font-weight: bold;
}

/* === Tab Controls === */
.dfm-tabs {
  display: flex;
  background: #d4d0c8;
  border-bottom: 1px solid #808080;
  padding: 2px 4px 0;
  flex-wrap: wrap;
}

.dfm-tab {
  padding: 3px 12px;
  margin-right: 2px;
  background: #d4d0c8;
  border: 1px solid #808080;
  border-bottom: none;
  border-radius: 3px 3px 0 0;
  cursor: pointer;
  font-size: 11px;
  color: #333;
  user-select: none;
}

.dfm-tab:hover {
  background: #e4e0d8;
}

.dfm-tab.active {
  background: #ece9d8;
  border-bottom: 1px solid #ece9d8;
  margin-bottom: -1px;
  font-weight: bold;
}

.dfm-tab-panel {
  display: none;
  position: relative;
  background: #ece9d8;
}

.dfm-tab-panel.active {
  display: block;
}

.dfm-page-control {
  position: relative;
}

/* === Containers === */
.dfm-groupbox {
  position: relative;
  border: 1px solid #aaa;
  padding: 4px;
  background: transparent;
}

.dfm-groupbox.panel-active {
  border: none;
  background: transparent;
  padding: 0;
}

.dfm-groupbox.edges-none {
  border: none;
}

.dfm-groupbox.edges-bottom {
  border: none;
  border-bottom: 1px solid #aaa;
}

.dfm-groupbox.edges-top {
  border: none;
  border-top: 1px solid #aaa;
}

.dfm-groupbox.edges-left {
  border: none;
  border-left: 1px solid #aaa;
}

.dfm-groupbox.edges-right {
  border: none;
  border-right: 1px solid #aaa;
}

.dfm-scrollbox {
  position: relative;
  overflow: auto;
}

/* === Input Controls === */
.dfm-input {
  background: white;
  border: 1px solid #7f9db9;
  padding: 1px 4px;
  font-size: 11px;
  font-family: inherit;
  height: 20px;
}

.dfm-input:disabled,
.dfm-input[readonly] {
  background: #f0f0f0;
  border-color: #d0d0d0;
  color: #999;
}

.dfm-select {
  background: white;
  border: 1px solid #7f9db9;
  padding: 1px 4px;
  font-size: 11px;
  font-family: inherit;
  height: 20px;
}

.dfm-select:disabled {
  background: #f0f0f0;
  border-color: #d0d0d0;
  color: #999;
}

/* === Check Combo Box === */
.dfm-check-combo {
  background: white;
  border: 1px solid #7f9db9;
  padding: 1px 4px;
  font-size: 11px;
  font-family: inherit;
  height: 20px;
  cursor: pointer;
  display: flex;
  align-items: center;
  position: relative;
  user-select: none;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.dfm-check-combo-dropdown {
  display: none;
  position: absolute;
  top: 100%;
  left: -1px;
  background: white;
  border: 1px solid #7f9db9;
  z-index: 100;
  max-height: 300px;
  overflow-y: auto;
  min-width: 100%;
}

.dfm-check-combo-dropdown.open {
  display: block;
}

.dfm-check-combo-dropdown label {
  display: flex;
  align-items: center;
  padding: 2px 6px;
  gap: 4px;
  font-size: 11px;
  cursor: pointer;
}

.dfm-check-combo-dropdown label:hover {
  background: #316ac5;
  color: white;
}

/* === Checkbox === */
.dfm-checkbox {
  display: inline-flex;
  align-items: center;
  font-size: 11px;
  gap: 2px;
  position: absolute;
}

.dfm-checkbox input {
  margin: 0;
}

/* === Label === */
.dfm-label {
  font-size: 11px;
  color: #333;
  position: absolute;
  white-space: nowrap;
}

/* === Button === */
.dfm-button {
  background: #d4d0c8;
  border: 1px solid #808080;
  padding: 2px 12px;
  font-size: 11px;
  font-family: inherit;
  cursor: pointer;
  border-radius: 1px;
  position: absolute;
}

.dfm-button:hover {
  background: #e4e0d8;
}

.dfm-button:active {
  background: #c4c0b8;
}

/* === Bevel === */
.dfm-bevel {
  position: absolute;
  border: none;
  border-top: 1px solid #808080;
  border-bottom: 1px solid #fff;
}

/* === Layout helpers === */
.dfm-absolute {
  position: absolute;
}

.dfm-align-client {
  position: relative !important;
  width: 100%;
}

.dfm-align-top {
  position: relative !important;
  width: 100%;
}

/* === Hidden === */
.dfm-hidden {
  display: none !important;
}
`;
