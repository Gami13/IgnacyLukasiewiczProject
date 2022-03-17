<?php
include_once('header.php');
giveHead('Mapa');
?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.13.0/css/ol.css" type="text/css">
<style>
    .mapa {
        height: 400px;
        width: 100%;
    }
</style>
<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.13.0/build/ol.js"></script>
<div class="map">
    <div id="map"></div>
    <script type="text/javascript">
        var a = new ol.Feature({
            geometry: new ol.geom.Point(ol.proj.fromLonLat([19.46047360048254, 52.1436588638329])),
        });

        const source = new ol.source.Vector({
            wrapX: false
        });
        const vector = new ol.layer.Vector({
            source: source,
        });
        const view = new ol.View({
            center: ol.proj.fromLonLat([19.46047360048254, 52.1436588638329]),
            zoom: 7
        })
        source.addFeature(a);
        var map = new ol.Map({
            target: 'map',
            layers: [
                new ol.layer.Tile({
                    source: new ol.source.OSM(),
                }),

            ],
            view: view
        });

        function flyTo(location, done) {
            const duration = 2000;
            const zoom = 13; //view.getZoom();
            let parts = 2;
            let called = false;

            function callback(complete) {
                --parts;
                if (called) {
                    return;
                }
                if (parts === 0 || !complete) {
                    called = true;
                    done(complete);
                }
            }
            view.animate({
                    center: location,
                    duration: duration,
                },
                callback
            );
            view.animate({
                    zoom: zoom - 1,
                    duration: duration / 2,
                }, {
                    zoom: zoom,
                    duration: duration / 2,
                },
                callback
            );
        }
    </script>

    <div class="menu">
        <div class="selection">
            <h1 onclick="document.getElementById('information').innerHTML='Miejscowość w której urodził się Ignacy Łukasiewicz';flyTo(ol.proj.fromLonLat([19.197713619304693,52.7170245698021]),function(){})">Zaduszniki</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Miejscowość w której Ignacy uczęszczał do Gimnazjum';flyTo(ol.proj.fromLonLat([21.999214540889604,50.0411339135228]),function(){})">Rzeszów</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Miejsowość w której Łukasiewicz miał praktyki aptekarskie';flyTo(ol.proj.fromLonLat([22.228779375313906,50.068603034981486]),function(){})">Łańcut</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Tu Łukasiewicz mieszkał z powodu nakazu (rok 1848)';flyTo(ol.proj.fromLonLat([24.030509014443133,49.84097119424592]),function(){})">Lwów</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Miejscowość w której Łukasiewicz uczęszczał na studia farmaceutyczne';flyTo(ol.proj.fromLonLat([19.941922775817805,50.06629710696173]),function(){})">Kraków</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Miejscowość w której Łukasiewicz uczęszczał na studia farmaceutyczne';flyTo(ol.proj.fromLonLat([16.37758414610083,48.21172485249128]),function(){})">Wiedeń</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Tu Łukasiewicz postawił pierwszą uliczną lampę naftową';flyTo(ol.proj.fromLonLat([21.16022800149886,49.654419841496974]),function(){})">Gorlice</h1>
            <h1 onclick="document.getElementById('information').innerHTML='Miejscowość w której Łukasiewicz został pochowany';flyTo(ol.proj.fromLonLat([21.689419203203016,49.67195924521435]),function(){})">Zręcin</h1>

        </div>
        <div id="information" class="information">

        </div>
    </div>
</div>
<?php
include_once('footer.html')
?>