import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchSite extends StatefulWidget {
  SearchSite({Key? key}) : super(key: key);

  @override
  State<SearchSite> createState() => _SearchSiteState();
}

class _SearchSiteState extends State<SearchSite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.03,
        maxHeight: MediaQuery.of(context).size.height * 0.35,
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        body: KakaoMapView(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          kakaoMapKey: 'e443bc8444db390ad3d01f125a88fe1a',
          lat: 37.517168,
          lng: 127.041347,
          showMapTypeControl: true,
          showZoomControl: true,
          markerImageURL:
              'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
          customScript: '''
    var markers = [];

    function addMarker(position) {

      var marker = new kakao.maps.Marker({position: position});

      marker.setMap(map);

      markers.push(marker);
    }

    for(var i = 0 ; i < 3 ; i++){
      addMarker(new kakao.maps.LatLng(33.450701 + 0.0003 * i, 126.570667 + 0.0003 * i));

      kakao.maps.event.addListener(markers[i], 'click', (function(i) {
        return function(){
          onTapMarker.postMessage('marker ' + i + ' is tapped');
        };
      })(i));
    }

		  var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
              ''',
        ),
      ),
    ));
  }
}
