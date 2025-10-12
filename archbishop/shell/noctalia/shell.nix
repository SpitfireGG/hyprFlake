{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  name = "noctalia-qml-dev";

  buildInputs = with pkgs; [
    qt6.qtdeclarative
    qt6.qtbase
    qt6.qtwayland
    qtcreator
  ];

  shellHook = ''
    # Get the Qt paths from Nix store
    QT_QML_PATH="${pkgs.qt6.qtdeclarative}/qml"

    # Project root
    PROJECT_ROOT="$PWD"

    # Set QML import paths (Qt standard paths + project paths)
    export QML_IMPORT_PATH="$QT_QML_PATH:$PROJECT_ROOT/Modules:$PROJECT_ROOT/Services:$PROJECT_ROOT/Widgets:$PROJECT_ROOT/Commons"
    export QML2_IMPORT_PATH="$QT_QML_PATH:$PROJECT_ROOT/Modules:$PROJECT_ROOT/Services:$PROJECT_ROOT/Widgets:$PROJECT_ROOT/Commons"

    # Qt plugin path
    export QT_PLUGIN_PATH="${pkgs.qt6.qtbase}/${pkgs.qt6.qtbase.qtPluginPrefix}"

    # Prevent Qt from using system paths
    export QT_QPA_PLATFORM_PLUGIN_PATH="${pkgs.qt6.qtbase}/${pkgs.qt6.qtbase.qtPluginPrefix}/platforms"

    # Add qmlls to PATH
    export PATH="${pkgs.qt6.qtdeclarative}/bin:$PATH"

    # Cleanup old cache if exists
    rm -rf .qmlls.cache 2>/dev/null || true

    echo "🚀 Noctalia QML Development Environment"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Qt Version: $(qmake6 --version 2>/dev/null | head -n1 || echo 'N/A')"
    echo ""
    echo "Tools available:"
    command -v qmlls >/dev/null && echo "  ✅ qmlls: $(which qmlls)" || echo "  ❌ qmlls not found"
    command -v qmlformat >/dev/null && echo "  ✅ qmlformat: $(which qmlformat)" || echo "  ❌ qmlformat not found"
    command -v qmllint >/dev/null && echo "  ✅ qmllint: $(which qmllint)" || echo "  ❌ qmllint not found"
    echo ""
    echo "Import paths:"
    echo "$QML2_IMPORT_PATH" | tr ':' '\n' | sed 's/^/  • /'
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    # Test qmlls
    echo ""
    echo "Testing qmlls..."
    if qmlls --version 2>&1 | grep -q "version"; then
      echo "✅ qmlls is working"
    else
      echo "⚠️  qmlls may have issues"
    fi
  '';
}
