yandex_source = (request, response) ->
  key = "ACYj6E4BAAAAfkabYgIAbBCPLcjH6QdC5PB1YQLBSepJLVUAAAAAAAAAAAAuPiM6UFDxrtGTdGr-exhf6qRDEA=="
  uri = "http://geocode-maps.yandex.ru/1.x/?format=json"
  uri += "&geocode=#{request.term}"
  uri += "&key=#{key}"
  uri += "&ll=99.8,68.6"
  uri += "&spn=160.4,45.0"
  uri += "&rspn=1"
  uri = encodeURI(uri)
  $.getJSON uri, (data) ->
    metadata = (metaDataProperty: {GeocoderMetaData: m}) -> m
    {response: {GeoObjectCollection: {featureMember: objs}}} = data
    acceptedKinds = ["locality", "street", "house"]
    objs = (o for {GeoObject: o} in objs when metadata(o).kind in acceptedKinds)
    console.log "objs: ", objs
    results = (metadata(o).text for o in objs)
    console.log "results: ", results
    response results

google_source = (request, response) ->
  key = "AIzaSyBnnUMgpb7bQ_VjMsSPdClVz-nYHUuPOm8"
  uri = "https://maps.googleapis.com/maps/api/place/autocomplete/json?sensor=false"
  uri += "&input=#{request.term}"
  uri += "&key=#{key}"
  uri += "&language=ru"
  uri += "&types=geocode"
  uri = encodeURI(uri)
  console.log "test1"
  $.getJSON uri, (data) ->
    console.log "test2"
    predictions = data.predictions
    console.log "predictions: ", predictions
    results = (p.description for p in predictions)
    console.log "results: ", results
    response results

$ ->
  $('input[geocomplete="yandex"]').autocomplete(
    source: yandex_source
  )
  $('input[geocomplete="xgoogle"]').autocomplete(
    source: google_source
  )
  input = document.getElementById('q2')
  autocomplete = new google.maps.places.Autocomplete(input, {})
  autocomplete.setTypes(['geocode'])

# vim: ts=2 sw=2
