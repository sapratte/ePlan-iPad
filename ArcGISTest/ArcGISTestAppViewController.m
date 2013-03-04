//
//  ArcGISTestAppViewController.m
//  ArcGISTest
//
//  Created by Sydney Pratte on 2013-02-27.
//  Copyright (c) 2013 Sydney Pratte. All rights reserved.
//

#import "ArcGISTestAppViewController.h"

@interface ArcGISTestAppViewController ()

@end

@implementation ArcGISTestAppViewController

@synthesize mapView = _mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];


    
    // The URL to the map displayed
    NSURL *mapURL = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"];
    // Create the layer with the URL
    AGSTiledMapServiceLayer *tiledLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:mapURL];
    // Set the mapView layer to the layer created above
    [self.mapView addMapLayer:tiledLayer withName:@"Tiled Layer"];
    
    
    
    // Set map extent to Calgary
    AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:102100];
	AGSEnvelope *envelope = [AGSEnvelope envelopeWithXmin:-12700397.2376
                                                     ymin:6627973.5948
                                                     xmax:-12695525.7363
                                                     ymax:6631550.464
                                         spatialReference:sr];
	[self.mapView zoomToEnvelope:envelope animated:YES];
    

    
    // Create the "police" Feature Layer
       NSURL *featureLayerURL = [NSURL URLWithString:@"http://136.159.14.25:6080/arcgis/rest/services/Annotations/AnnotationLayers/FeatureServer"];
       AGSFeatureLayer *policeFeatureLayer = [AGSFeatureLayer featureServiceLayerWithURL: featureLayerURL mode:AGSFeatureLayerModeOnDemand];
    
    
    
    
    // Create a simple marker symbol
    AGSSimpleMarkerSymbol *markerSymbol = [AGSSimpleMarkerSymbol simpleMarkerSymbol];
    markerSymbol.color = [UIColor blueColor];
    markerSymbol.style = AGSSimpleMarkerSymbolStyleCircle;
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
