$(document).ready(function() {
  $('input[geocomplete="yandex"]').autocomplete({
    /*
    search: function(event, ui) {
      //console.log($(event.target).val())
      //$(event.target).autocomplete("option", "source", ['123', '234'])
      input = $(event.target)
      uri  = "http://geocode-maps.yandex.ru/1.x/?format=json"
      uri += "&geocode=" + input.val()
      uri += "&key=" + "ACYj6E4BAAAAfkabYgIAbBCPLcjH6QdC5PB1YQLBSepJLVUAAAAAAAAAAAAuPiM6UFDxrtGTdGr-exhf6qRDEA=="
      uri = encodeURI(uri)
      $.getJSON(uri, function(data) {
        geoObjects = data.response.GeoObjectCollection.featureMember
        results = $.map(geoObjects, function(o) {
          console.log("result: ", o.GeoObject.name)
          o.GeoObject.name
        })
        input.autocomplete("option", "source", results)
      })
    },
    */
    source: function(request, response) {
      uri  = "http://geocode-maps.yandex.ru/1.x/?format=json"
      uri += "&geocode=" + request.term
      uri += "&key=" + "ACYj6E4BAAAAfkabYgIAbBCPLcjH6QdC5PB1YQLBSepJLVUAAAAAAAAAAAAuPiM6UFDxrtGTdGr-exhf6qRDEA=="
      uri += "&ll=99.8,68.6"
      uri += "&spn=160.4,45.0"
      uri += "&rspn=1"
      uri = encodeURI(uri)
      $.getJSON(uri, function(data) {
        objs = data.response.GeoObjectCollection.featureMember
        objs = $.map(objs, function(o) { return o.GeoObject })
        objs = $.grep(objs, function(o) {
          kind = o.metaDataProperty.GeocoderMetaData.kind
          acceptedKinds = ["locality", "street", "house"]
          return $.inArray(kind, acceptedKinds) > -1
        })
        console.log("objs: ", objs)
        results = $.map(objs, function(o) { return o.metaDataProperty.GeocoderMetaData.text })
        console.log("results: ", results)
        response(results)
      })
    }
  })
})

/* vim: set ts=2 sw=2: */
