## Diferenças de idade nos romances de Holywood

Projeto exemplo para análise exploratória e descritiva (EDA) usando dados de romance em filmes.

## Os dados

Partimos do projeto de @lynnandtonic que analisa a diferença de idade entre as partes de pares românticos nos filmes de Hollywood. A análise original dela está em http://hollywoodagegap.com/, e os dados e código estão gentilmente disponíveis em https://github.com/lynnandtonic/hollywood-age-gap. 

Em qualquer trabalho derivado deste, por favor cite a fonte original. 

## Dependências

```
deps = c("tidyverse", "stringr", "here", "skimr")
install.packages(deps)
```

## Organização

* `code` - Scripts para ingerir e transformar os dados brutos, e funções fatoradas de relatórios
* `data` - Dados depois de obtidos, organizados e transformados a partir da fonte original
* `reports` - Notebooks com análises

## Como começar

(Instale as dependências e) Clone e abra `eda-pares-romanticos.Rproj`. Você pode começar alterando  `reports/eda.Rmd`.
