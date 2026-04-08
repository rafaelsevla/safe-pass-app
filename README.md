# README

## Cleaning

### Remove todos os arquivos compilados de assets
rails assets:clobber

### Remove o cache temporário do Rails e do Sprockets
rm -rf tmp/cache/assets

### Rodar para executar as mudanças de scss
./bin/dev

### Ou mudanças apenas do rails:
rails s