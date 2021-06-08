
# Adicionar campos Z a tcode MB52 #

[![N|Solid](https://wiki.scn.sap.com/wiki/download/attachments/1710/ABAP%20Development.png?version=1&modificationDate=1446673897000&api=v2)](https://www.sap.com/brazil/developer.html)

~~Quando Deus der coragem~~ Futuramente eu vou melhorar o codigo e mudar com uma boa documentação.
Desenvolvimento para adicionar novos campos na transação MB52.
Baseado no link [ADDITIONAL FIELD IN MB52 OUTPUT REPORT](https://ilakkiasabap.wordpress.com/2019/05/11/additional-field-in-mb52-output-report/)


## Necessidade ##

---
De acordo com os Pedidos de Compras (que são acessados pela `ME23N`), será criada _Entrada de Mercadoria_ pela transação `MIRO` e depois a _Nota Fiscal_ (que pode ser acessada pela transação `J1B3N`). Houve a necessidade de que, antes disso, seja feita apenas uma simulação e os dados da _Nota Fiscal_ fossem recuperados para uma verificação, entender se esta da maneira esperada a configuração de Impostos ~~ou sei la mesmo porque o funcional inventou isso viu~~.

## Tecnologia adotada ##

---
A criação da classe sera para atender a necessidade e provera os dados de _Nota Fiscal_ caso seja preciso alguma validação referente a impostos.

## Solução ##
