# fileCreator

Script utilitário desenvolvido para auxiliar na criação dos arquivos de um projeto Java

Para seu funcionamento, é necessário que haja uma convenção para a estrutra de pastas do projeto, no meu caso ficou do seguinte modo : 

  - domain para as entidades
  - services para especificação das interfaces
  - dentro de services, a implementação das mesmas, ServiceImpl
  - repository para as classes de persistência
  - resource para os controladores rest

O problema é que durante o mapeamento de uma entidade, muitas vezes precisamos replicar os arquivos para as todas as pastas com seu respectivo papel, e este script visa agilizar este processo.

Basta copíá-lo para a pasta raiz do projeto, onde se localiza a classe main,  e executar via terminal. A medida que são criados os arquivos das classes domain, todos os outros arquivos são criados e já pré configurados com um setup mínimo de funcionamento. 


