jQuery ->
 $('#convenios').dataTable({
  sPaginationType: "bootstrap"
  aLengthMenu: [ 10, 25, 50, 100 ]
  iDisplayLength: 10
  bScrollCollapse: true
  bProcessing: true
  bDeferRender: true
  oLanguage:
  	sInfo: "Exibindo _START_  à _END_  de _TOTAL_ registros"
  	sInfoEmpty: "Exibindo 0 à 0 de 0 entradas"
  	sInfoFiltered: "(filtrado de um total de MAX registros)"
  	sLengthMenu: "Exibir _MENU_ registros por página"
  	sLoadingRecords: "Carregando..."
  	sProcessing: "Processando..."
  	sSearch: "Buscar:"
  	sZeroRecords: "Não foi encontrado nenhum resultado para sua busca"
  	oPaginate:
		  sFirst: "Início"
		  sNext: "Próximo"
		  sLast: "Final"
		  sPrevious: "Anterior"
		  sEmptyTable: "Nenhum dado disponível na tabela"
});
