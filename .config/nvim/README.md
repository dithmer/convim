# plugins

List of plugins can be found in code in [plugins.lua](lua/plugins.lua)

# language servers

If not said in the particular area of the language server, all binaries have to be in PATH

## lua - sumneko
This one is configured to search for the binary at `/opt/lua-language-server/bin/lua-language-server`
Configuration can be found here [lsp.lua](lua/lsp.lua#L29)

https://github.com/sumneko/lua-language-server

## bash - bashls
https://github.com/mads-hartmann/bash-language-server

## Go - gopls, golangci-lint
https://github.com/golang/tools/tree/master/gopls
https://github.com/nametake/golangci-lint-langserver
https://github.com/golangci/golangci-lint

## Web - volar, typescript, tailwindcss
Volar looks for global typescript installation in `/usr/lib/node_modules/typescript/lib/`.
Configuration can be found here [lsp.lua](lua/lsp.lua#L14)

https://github.com/johnsoncodehk/volar
https://github.com/typescript-language-server/typescript-language-server
https://github.com/tailwindlabs/tailwindcss-intellisense

## Terraform - terraformls & tflint
https://github.com/hashicorp/terraform-ls
https://github.com/terraform-linters/tflint

## Rust - rust-analyzer
https://rust-analyzer.github.io/

# formatters

## prettier
https://prettier.io/

## gofmt
https://pkg.go.dev/cmd/gofmt

# debuggers

## go - go-delve
https://github.com/go-delve/delve
