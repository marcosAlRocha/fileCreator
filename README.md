# fileCreator

Script utilitário desenvolvido para auxiliar na criação de arquivos em projeto Java com SpringBoot, JPA, JUnit, H2

O problema é que durante o mapeamento de uma entidade, muitas vezes precisamos replicar os arquivos para as todas as pastas com seu respectivo papel. 
Este script visa agilizar este processo.

Para seu funcionamento, é necessário que haja uma convenção para a estrutra de pastas do projeto, no meu caso ficou do seguinte modo : 

  - domain para as entidades
  - services para especificação das interfaces
  - dentro de services, a implementação das mesmas, ServiceImpl
  - repository para as classes de persistência
  - resource para os controladores rest

  = Mesma estrutura se replica para arquivos de testes

Basta copíá-lo para a pasta raiz do projeto, onde se localiza o pom.xml, e executar via terminal. A medida que são criados os arquivos das classes domain, todos os outros arquivos são criados e já pré configurados com um setup mínimo de funcionamento. 

Caso ao subir a aplicação ocorra erro de mapeamento de Url - Failed to configure a DataSource: 'url' attribute is not specified and no embedded datasource could be configured - basta colocar <scope>provided</scope> na dependência do starter data-jpa.





