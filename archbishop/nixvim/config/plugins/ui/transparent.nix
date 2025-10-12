{
  plugins.transparent = {
    enable = true;
    settings = {
      exclude_groups = [ ];
      extra_groups = [
        "BufferLineTabClose"
        "BufferLineBufferSelected"
        "BufferLineFill"
        "BufferLineBackground"
        "BufferLineSeparator"
        "BufferLineIndicatorSelected"
      ];
      groups = [
        "Normal"
        "NormalNC"
        "Comment"
        "Constant"
        "Special"
        "Identifier"
        "Statement"
        "PreProc"
        "Type"
        "Underlined"
        "Todo"
        "String"
        "Function"
        "Conditional"
        "Repeat"
        "Operator"
        "Structure"
        "LineNr"
        "NonText"
        "SignColumn"
        "CursorLine"
        "CursorLineNr"
        "StatusLine"
        "StatusLineNC"
        "EndOfBuffer"
      ];
    };
  };
}
