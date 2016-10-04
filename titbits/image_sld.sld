<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" units="mm" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>cfr_v5</se:Name>
    <UserStyle>
      <se:Name>cfr_v5</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>Drought-within one week</se:Name>
          <se:Description>
            <se:Title>Drought-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>1</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="drought3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Drought-Todate</se:Name>
          <se:Description>
            <se:Title>Drought-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>1</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="drought1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Drought-week ago</se:Name>
          <se:Description>
            <se:Title>Drought-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>1</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="drought5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Flood-Todate</se:Name>
          <se:Description>
            <se:Title>Flood-Todate</se:Title>
          </se:Description>
              <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>2</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="flood1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Flood-within one week</se:Name>
          <se:Description>
            <se:Title>Flood-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>2</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="flood3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Flood-week ago</se:Name>
          <se:Description>
            <se:Title>Flood-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>2</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="flood5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Earthquake-Todate</se:Name>
          <se:Description>
            <se:Title>Earthquake-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>3</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="earthquake1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Earthquake-within one week</se:Name>
          <se:Description>
            <se:Title>Earthquake-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>3</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="earthquake3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Earthquake-week ago</se:Name>
          <se:Description>
            <se:Title>Earthquake-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>3</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="earthquake5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Tsunami-Todate</se:Name>
          <se:Description>
            <se:Title>Tsunami-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>4</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="tsunami1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Tsunami-within one week</se:Name>
          <se:Description>
            <se:Title>Tsunami-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>4</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="tsunami3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Tsunami-week ago</se:Name>
          <se:Description>
            <se:Title>Tsunami-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>4</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="tsunami5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Landslides-Todate</se:Name>
          <se:Description>
            <se:Title>Landslides-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>5</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo> 
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="landslide1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Landslides-within one week</se:Name>
          <se:Description>
            <se:Title>Landslides-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>5</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="landslide3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
         <se:Rule>
          <se:Name>Landslides-week ago</se:Name>
          <se:Description>
            <se:Title>Landslides-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>5</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="landslide5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Cyclone-Todate</se:Name>
          <se:Description>
            <se:Title>Cyclone-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>6</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="cyclone1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Cyclone-within one week</se:Name>
          <se:Description>
            <se:Title>Cyclone-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>6</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="cyclone3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Cyclone-week ago</se:Name>
          <se:Description>
            <se:Title>Cyclone-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>6</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="cyclone5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Explosion-Todate</se:Name>
          <se:Description>
            <se:Title>Explosion-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>7</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="explosion1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Explosion-within one week</se:Name>
          <se:Description>
            <se:Title>Explosion-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>7</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="explosion3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Explosion-week ago</se:Name>
          <se:Description>
            <se:Title>Explosion-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>7</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="explosion5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Fire-Todate</se:Name>
          <se:Description>
            <se:Title>Fire-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>8</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
            <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="fire1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Fire-within one week</se:Name>
          <se:Description>
            <se:Title>Fire-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>8</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="fire3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Fire-week ago</se:Name>
          <se:Description>
            <se:Title>Fire-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>8</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="fire5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Thunder Storm-Todate</se:Name>
          <se:Description>
            <se:Title>Thunder Storm-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>9</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="thunderstorm1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Thunder Storm-within one week</se:Name>
          <se:Description>
            <se:Title>Thunder Storm-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>9</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="thunderstorm3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Thunder Storm-week ago</se:Name>
          <se:Description>
            <se:Title>Thunder Storm-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>9</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="thunderstorm5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Epedemic-Todate</se:Name>
          <se:Description>
            <se:Title>Epedemic-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>10</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="epedemic1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Epedemic-within one week</se:Name>
          <se:Description>
            <se:Title>Epedemic-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>10</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="epedemic3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Epedemic-week ago</se:Name>
          <se:Description>
            <se:Title>Epedemic-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>10</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="epedemic5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
             <se:Rule>
          <se:Name>Chemical-Todate</se:Name>
          <se:Description>
            <se:Title>Chemical-Todate</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>11</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
            <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>'2016-09-26'</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="chemical1.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      <se:Rule>
          <se:Name>Chemical-within one week</se:Name>
          <se:Description>
            <se:Title>Chemical-within one week</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>11</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-26</ogc:Literal>
             </ogc:PropertyIsLessThan>
              <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsGreaterThanOrEqualTo>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="chemical3.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
            <se:Rule>
          <se:Name>Chemical-week ago</se:Name>
          <se:Description>
            <se:Title>Chemical-week ago</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <And>
             <ogc:PropertyIsEqualTo>
               <ogc:PropertyName>disaster_type</ogc:PropertyName>
               <ogc:Literal>11</ogc:Literal>
             </ogc:PropertyIsEqualTo>             
             <ogc:PropertyIsLessThan>
               <ogc:PropertyName>reported_date</ogc:PropertyName>
               <ogc:Literal>2016-09-19</ogc:Literal>
             </ogc:PropertyIsLessThan>
            </And>  
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
            <ExternalGraphic>
            <OnlineResource xlink:type="simple" xlink:href="chemical5.png"/>
            <Format>image/png</Format>
            </ExternalGraphic>
            <Size>32</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>

