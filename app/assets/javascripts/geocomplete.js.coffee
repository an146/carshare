yandex_source = (request, response) ->
  key = "ACYj6E4BAAAAfkabYgIAbBCPLcjH6QdC5PB1YQLBSepJLVUAAAAAAAAAAAAuPiM6UFDxrtGTdGr-exhf6qRDEA=="
  uri = "http://geocode-maps.yandex.ru/1.x/?format=json"
  uri += "&geocode=" + request.term
  uri += "&key=" + key
  uri += "&ll=99.8,68.6"
  uri += "&spn=160.4,45.0"
  uri += "&rspn=1"
  uri = encodeURI(uri)
  metadata = (metaDataProperty: {GeocoderMetaData: m}) -> m
  $.getJSON uri, (data) ->
    {response: {GeoObjectCollection: {featureMember: objs}}} = data
    acceptedKinds = ["locality", "street", "house"]
    objs = (o for {GeoObject: o} in objs when metadata(o).kind in acceptedKinds)
    console.log "objs: ", objs
    results = (metadata(o).text for o in objs)
    console.log "results: ", results
    response results

$ ->
  $('input[geocomplete="yandex"]').autocomplete(
    source: yandex_source
  )

# vim: ts=2 sw=2
