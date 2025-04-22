# Introdução
## Relatório Técnico de Avaliação de Software/Hardware

1. Informações Gerais do Projeto

* Nome do Projeto: Glip's Rejection

* Data de Início: 30/6/2024

* Data de Término: Em andamento

* Equipe de Desenvolvimento: Jorge Gonzalez Silva

* Responsável pelo Relatório: Jorge Gonzalez Silva

* Data do Relatório: 22/04/2025

---

## 2. Resumo Executivo:

Objetivo do Projeto: O objetivo deste projeto é abranger o utilizador em uma experiência de jogo, este criado por referência a outro jogo mais antigo.

Resumo das Funcionalidades: Jogabilidade focada em combate e exploração.

Sistema de estados para inimigo.

Transições dinâmicas entre salas (rooms).

Interações entre poderes dos personagens.

Persistência de dados utilizando JSON.

---

## 3. Metodologia de Desenvolvimento
Modelo de Desenvolvimento Utilizado: Ágil, com ciclos iterativos de implementação e teste.

Ferramentas e Tecnologias Utilizadas: 
* GameMaker Studio 2: Ambiente principal de desenvolvimento.
* GX.Games: Ferramenta para integração do modo multiplayer online.
* JSON: Guardar as coordenadas, vida, pontos, slime(personagem) e progresso de salas e inimigos derrotados.
* GitHub: Controle de versão detalhado e comentários descritivos para patches.

Cronograma e Fases de Desenvolvimento: Foco atual no desenvolvimento de lógica single-player.

---

## 4 Avaliação dos Critérios de Qualidade


### 4.1. Funcionalidade
Descrição: O jogo apresenta mecânicas robustas como interação ambiental e integração de poderes únicos dos personagens.

Avaliação: Percentual de conformidade: 75% (Suficiente)

Justificativa: Grande parte das funcionalidades foi implementada com sucesso.



### 4.2. Segurança
Descrição: Medidas incluem tratamento de dados no backend, validação mínima e criação de tabelas com suporte a restrições.

Testes de Segurança Realizados: Verificações dos dados json ao utilizar o debugger do gamemaker studio 2, o ficheiro associado aos dados e verificações de armazenamento dos mesmos

Avaliação: Percentual de conformidade: 75% (Bom)

Justificativa: Os dados JSON já são armazenados no ficheiro e são utilizados para guardar o progresso do jogador



### 4.3. Desempenho

Descrição: Tempo de resposta do backend.

Testes de Desempenho Realizados: Simulações de múltiplos acessos simultâneos ao servidor.

Avaliação: Percentual de conformidade: 80% (Bom)

Justificativa: O jogo responde de forma eficiente, mas pode ser necessário otimizar para cenários com carga maior.


### 4.4. Integração

Descrição: Utiliza JSON para persistência de dados no GameMaker.

Avaliação: Percentual de conformidade: 70% (Bom)

Justificativa: A integração básica atual funciona bem para single-player.



### 4.5. Documentação
Descrição: A documentação do código inclui mensagens detalhadas no console e comentários explicativos.

Avaliação: Percentual de conformidade: 80% (Bom) 
 
Justificativa: A documentação cobre as principais funcionalidades


---

## 5. Testes Realizados

Teste Unitário: Teste de funções e lógica em GML

Resultado: Passou com correções 

Conformidade: 80%

----

Teste Funcional: Avaliação de combate e transições de sala

Resultado: Parcialmente funcional

Conformidade: 85%

----

Testes de Segurança: Testes com o ficheiro json e os respetivos dados no jogo

Resultado: Os dados são armazenados e utilizados, permitindo que se guarde o progresso do jogador

Conformidade: 70%

----

Testes de desempenho: Simulação com carga alta e uso de Debugger

Resultado: FPS instável

Conformidade: 70%

----

### -Resultados dos Testes:
```
| Tipo de Teste       | Descrição                                  | Resultado                          | Conformidade (%) |
|---------------------|--------------------------------------------|------------------------------------|------------------|
| Teste Unitário      | Teste de funções e lógica em GML           | Passou com correções               |       [80%]      |
| Teste Funcional     | Avaliação de combate e transições de sala  | Parcialmente funcional             |       [85%]      |
| Teste de Segurança  | Testes com o ficheiro json e dados no jogo | Progresso armazenado e utilizado   |       [70%]      | 
| Teste de Desempenho | Simulação com carga alta e uso de Debugger | FPS instáveis                      |       [70%]      |
|---------------------|--------------------------------------------|------------------------------------|------------------|	
```

---

## 6. Conclusão e Recomendações

Conclusão Geral: O projeto apresenta avanços significativos na jogabilidade e integração de sistemas, com boa aderência aos objetivos propostos.

Principais Pontos Fortes: Integração com JSON e GX.Games e documentação detalhada.

Principais Pontos de Melhoria: Otimização do modo multiplayer, melhorias no desempenho em hardware menos potente.

Recomendações: Investir em testes automatizados

---

## 7. Cronograma Detalhado de Realização do Projeto

### 7.1. Fases do Projeto
Descrever cada fase do projeto, com datas de início, término e duração:

* Fase 1: Investigação e Levantamento de Requisitos

Início: [30/06/2024]

Término: [31/06/2024]

---

* Fase 2: Planeamento e Design

Início: 11/7/2024

Término: 20/7/2024

---

* Fase 3: Desenvolvimento (Single-Player)

Início: 31/06/2024

Término: Em andamento

---

* Fase 4: Planeamento e Desenvolvimento do Multiplayer

Início:16/10/2024

Término: Pendente

---

* Fase 5: Testes e Otimização

Início: Pendente

Término: Pendente

---

* Fase 6: Implementação e Entrega

Início: Pendente

Término: Pendente

---

### 7.2. Marcos Importantes 

Conclusão da fase de requisitos: 10/7/2024

Aprovação do Design: 20/7/2024

Estrutura lógica e gráfica.

Primeira Versão Beta: Pendente

Versão funcional single-player

Integração no GX.Games: Pendente(falta criar um executável para poder jogar sem localhost)
Multiplayer Implementado.

---

8. Anexos
- Código-Fonte:  
https://github.com/Blaze2007007/Glips_rejection/tree/main
  
- Manuais e Documentação Técnica:  
  Descrições de patches no github, codigo totalmente comentado e diário de ficheiro txt.

- Resultados de Testes:  
 Incluídos acima.

---

Assinaturas:

Responsável pelo Desenvolvimento: Jorge Gonzalez Silva

Data: _______________

Responsável pela Avaliação: ____________________________________

Data: _______________
