# journey_active_users

Segmentação de usuários via automation studio (salesforce marketing cloud) para popular a jornada de usuários ativos, quebrado por porte de usuário. 


### Contexto: 
O enjoei preciasava de uma estratégia de Lifecycle em jornadas de CRM para falar com sua base de usuários ativos. 

### CRM:
Será enviado uma jornada através do Journey Builder (Salesforce Marketing Cloud), uma sequência de diversos emails no decorrer dos próximos 30 dias, classificando usuários por classes de uso (de acordo com a quantidade de produtos postados Vs. recência da ultima postagem), cada classe recebe uma determinada sequencia de comunicações com diferentes tipos de incentivos e apelos para se manter como um user ativo realizando mais postagens.

A query é feita no BigQuery e enviada para o Automation Studio da Salesforce através da geração de um arquivo FTP, enviando diariamente e populando a Data Extension que ativa a jornada. 

### Segmentação: 
* Pessoas que realizaram upload de pelo menos um produto na plataforma nos ultimos dias (de acordo com sua respectiva regra de categorização de porte) 
* Possuem opt in para recebimento de comunicações de push e email via crm
 

