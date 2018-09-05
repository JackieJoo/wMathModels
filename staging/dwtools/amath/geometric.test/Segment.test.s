( function _Segment_test_s_( ) {

'use strict';

// return;

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }


  var _ = _global_.wTools;

  _.include( 'wTesting' );
  _.include( 'wMathVector' );
  _.include( 'wMathSpace' );

  require( '../geometric/aConcepts.s' );

}

//

var _ = _global_.wTools.withArray.Float32;
var Space = _.Space;
var vector = _.vector;
var vec = _.vector.fromArray;
var avector = _.avector;
var sqrt = _.sqrt;
var Parent = _.Tester;

_.assert( _.routineIs( sqrt ) );

// --
// test
// --

function make( test )
{
  test.case = 'srcDim undefined'; /* */

  var srcDim = undefined;
  var gotSegment = _.segment.make( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim null'; /* */

  var srcDim = null;
  var gotSegment = _.segment.make( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim 2'; /* */

  var srcDim = 2;
  var gotSegment = _.segment.make( srcDim );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim array'; /* */

  var srcDim = [ 0, 1, 2, 3 ];
  var gotSegment = _.segment.make( srcDim );
  var expected = [ 0, 1, 2, 3 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim vector'; /* */

  var srcDim = _.vector.fromArray([ 0, 1, 2, 3 ]);
  var gotSegment = _.segment.make( srcDim );
  var expected = [ 0,1,2,3 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.make( [ 0, 0 ], [ 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment.make( 'segment' ));
}

//

function makeZero( test )
{
  test.case = 'srcDim undefined'; /* */

  var srcDim = undefined;
  var gotSegment = _.segment.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim null'; /* */

  var srcDim = null;
  var gotSegment = _.segment.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim 2'; /* */

  var srcDim = 2;
  var gotSegment = _.segment.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim array'; /* */

  var srcDim = [ 0, 1, 2, 3 ];
  var gotSegment = _.segment.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim vector'; /* */

  var srcDim = _.vector.fromArray([ 0, 1, 2, 3 ]);
  var gotSegment = _.segment.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.makeZero( [ 0, 0 ], [ 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment.makeZero( 'segment' ));

}

//

function makeNil( test )
{
  test.case = 'srcDim undefined'; /* */

  var srcDim = undefined;
  var gotSegment = _.segment.makeNil( srcDim );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim null'; /* */

  var srcDim = null;
  var gotSegment = _.segment.makeNil( srcDim );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim 2'; /* */

  var srcDim = 2;
  var gotSegment = _.segment.makeNil( srcDim );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim array'; /* */

  var srcDim = [ 0, 1, 2, 3 ];
  var gotSegment = _.segment.makeNil( srcDim );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  test.case = 'srcDim vector'; /* */

  var srcDim = _.vector.fromArray([ 0, 1, 2, 3 ]);
  var gotSegment = _.segment.makeNil( srcDim );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcDim );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.makeNil( [ 0, 0 ], [ 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment.makeNil( 'segment' ));
}

//

function zero( test )
{
  test.case = 'srcSegment undefined'; /* */

  var srcSegment = undefined;
  var gotSegment = _.segment.zero( srcSegment );
  var expected = [ 0, 0, 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcSegment );

  test.case = 'srcSegment null'; /* */

  var srcSegment = null;
  var gotSegment = _.segment.zero( srcSegment );
  var expected = [ 0, 0, 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcSegment );

  test.case = 'srcSegment 2'; /* */

  var srcSegment = 2;
  var gotSegment = _.segment.zero( srcSegment );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcSegment );

  test.case = 'srcSegment array'; /* */

  var srcSegment = [ 0, 1, 2, 3 ];
  var gotSegment = _.segment.zero( srcSegment );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( gotSegment, expected );
  test.is( gotSegment === srcSegment );

  test.case = 'srcSegment vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3 ] );
  var gotSegment = _.segment.zero( srcSegment );
  var expected =  _.vector.fromArray( [ 0, 0, 0, 0 ] );
  test.identical( gotSegment, expected );
  test.is( gotSegment === srcSegment );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.zero( [ 0, 0 ], [ 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment.zero( 'segment' ));

}

//

function nil( test )
{
  test.case = 'srcSegment undefined'; /* */

  var srcSegment = undefined;
  var gotSegment = _.segment.nil( srcSegment );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcSegment );

  test.case = 'srcSegment null'; /* */

  var srcSegment = null;
  var gotSegment = _.segment.nil( srcSegment );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcSegment );

  test.case = 'srcSegment 2'; /* */

  var srcSegment = 2;
  var gotSegment = _.segment.nil( srcSegment );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment !== srcSegment );

  test.case = 'srcSegment array'; /* */

  var srcSegment = [ 0, 1, 2, 3 ];
  var gotSegment = _.segment.nil( srcSegment );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity ];
  test.identical( gotSegment, expected );
  test.is( gotSegment === srcSegment );

  test.case = 'srcSegment vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3 ] );
  var gotSegment = _.segment.nil( srcSegment );
  var expected = _.vector.fromArray( [ Infinity, Infinity, - Infinity, - Infinity ] );
  test.identical( gotSegment, expected );
  test.is( gotSegment === srcSegment );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.nil( [ 0, 0 ], [ 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment.nil( 'segment' ));
}

//

function from( test )
{
  test.case = 'Same instance returned - array'; /* */

  var srcSegment = [ 0, 0, 2, 2 ];
  var expected = [ 0, 0, 2, 2 ];

  var gotSegment = _.segment.from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment === gotSegment );

  test.case = 'Different instance returned - vector -> array'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 0, 2, 2 ] );
  var expected = _.vector.fromArray( [ 0, 0, 2, 2 ] );

  var gotSegment = _.segment.from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment === gotSegment );

  test.case = 'Same instance returned - empty array'; /* */

  var srcSegment = [];
  var expected =  [];

  var gotSegment = _.segment.from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment === gotSegment );

  test.case = 'Different instance returned - null -> array'; /* */

  var srcSegment = null;
  var expected =  [ 0, 0, 0, 0, 0, 0 ];

  var gotSegment = _.segment.from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment !== gotSegment );
  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.from( ));
  test.shouldThrowErrorSync( () => _.segment.from( [ 0, 0, 0, 0, 0 ] ));
  test.shouldThrowErrorSync( () => _.segment.from( [ 0, 0, 0, 0 ], [ 0, 0, 0, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment.from( 'segment' ));
  test.shouldThrowErrorSync( () => _.segment.from( NaN ));
  test.shouldThrowErrorSync( () => _.segment.from( undefined ));
}

//

function _from( test )
{
  test.case = 'Same instance returned - vector'; /* */

  var srcSegment = [ 0, 0, 2, 2 ];
  var expected = _.vector.from( [ 0, 0, 2, 2 ] );

  var gotSegment = _.segment._from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment !== gotSegment );

  test.case = 'Different instance returned - vector -> vector'; /* */

  var srcSegment = _.vector.from( [ 0, 0, 2, 2 ] );
  var expected = _.vector.from( [ 0, 0, 2, 2 ] );

  var gotSegment = _.segment._from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment === gotSegment );

  test.case = 'Same instance returned - empty vector'; /* */

  var srcSegment = [];
  var expected =  _.vector.from( [] );

  var gotSegment = _.segment._from( srcSegment );
  test.identical( gotSegment, expected );
  test.is( srcSegment !== gotSegment );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment._from( ));
  test.shouldThrowErrorSync( () => _.segment._from( [ 0, 0, 0, 0, 0 ] ));
  test.shouldThrowErrorSync( () => _.segment._from( [ 0, 0, 0, 0 ], [ 0, 0, 0, 1 ] ));
  test.shouldThrowErrorSync( () => _.segment._from( 'segment' ));
  test.shouldThrowErrorSync( () => _.segment._from( NaN ));
  test.shouldThrowErrorSync( () => _.segment._from( null ));
  test.shouldThrowErrorSync( () => _.segment._from( undefined ));
}

//

function is( test )
{
  debugger;
  test.case = 'array'; /* */

  test.is( _.segment.is( [] ) );
  test.is( _.segment.is([ 0, 0 ]) );
  test.is( _.segment.is([ 1, 2, 3, 4 ]) );
  test.is( _.segment.is([ 0, 0, 0, 0, 0, 0 ]) );

  test.case = 'vector'; /* */

  test.is( _.segment.is( _.vector.fromArray([]) ) );
  test.is( _.segment.is( _.vector.fromArray([ 0, 0 ]) ) );
  test.is( _.segment.is( _.vector.fromArray([ 1, 2, 3, 4 ]) ) );
  test.is( _.segment.is( _.vector.fromArray([ 0, 0, 0, 0, 0, 0 ]) ) );

  test.case = 'not segment'; /* */

  test.is( !_.segment.is([ 0 ]) );
  test.is( !_.segment.is([ 0, 0, 0 ]) );

  test.is( !_.segment.is( _.vector.fromArray([ 0 ]) ) );
  test.is( !_.segment.is( _.vector.fromArray([ 0, 0, 0 ]) ) );

  test.is( !_.segment.is( 'abc' ) );
  test.is( !_.segment.is( { origin : [ 0, 0, 0 ], direction : [ 1, 1, 1 ] } ) );
  test.is( !_.segment.is( function( a, b, c ){} ) );

  test.is( !_.segment.is( null ) );
  test.is( !_.segment.is( undefined ) );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.is( ));
  test.shouldThrowErrorSync( () => _.segment.is( [ 0, 0 ], [ 1, 1 ] ));

}

//

function dimGet( test )
{
  test.case = 'srcSegment 1D - array'; /* */

  var srcSegment = [ 0, 1 ];
  var gotDim = _.segment.dimGet( srcSegment );
  var expected = 1;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcSegment );

  test.case = 'srcSegment 1D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1 ] );
  var gotDim = _.segment.dimGet( srcSegment );
  var expected = 1;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcSegment );

  test.case = 'srcSegment 2D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3 ];
  var gotDim = _.segment.dimGet( srcSegment );
  var expected = 2;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcSegment );

  test.case = 'srcSegment 2D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3 ] );
  var gotDim = _.segment.dimGet( srcSegment );
  var expected = 2;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcSegment );

  test.case = 'srcSegment 3D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3, 4, 5 ];
  var gotDim = _.segment.dimGet( srcSegment );
  var expected = 3;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcSegment );

  test.case = 'srcSegment 3D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3, 4, 5 ] );
  var gotDim = _.segment.dimGet( srcSegment );
  var expected = 3;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcSegment );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.dimGet( ) );
  test.shouldThrowErrorSync( () => _.segment.dimGet( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.dimGet( [ 0, 0 ], [ 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.segment.dimGet( 'segment' ) );
  test.shouldThrowErrorSync( () => _.segment.dimGet( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.dimGet( null ) );
  test.shouldThrowErrorSync( () => _.segment.dimGet( undefined ) );

}

//

function originGet( test )
{
  test.case = 'Source segment remains unchanged'; /* */

  var srcSegment = [ 0, 0, 1, 1 ];
  var expected = _.vector.from( [ 0, 0 ] );

  var gotOrigin = _.segment.originGet( srcSegment );
  test.identical( gotOrigin, expected );

  var oldSrcSegment = [ 0, 0, 1, 1 ];
  test.equivalent( srcSegment, oldSrcSegment );

  test.case = 'srcSegment 1D - array'; /* */

  var srcSegment = [ 0, 1 ];
  var gotOrigin = _.segment.originGet( srcSegment );
  var expected = _.vector.from( [ 0 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcSegment );

  test.case = 'srcSegment 1D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1 ] );
  var gotOrigin = _.segment.originGet( srcSegment );
  var expected = _.vector.from( [ 0 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcSegment );

  test.case = 'srcSegment 2D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3 ];
  var gotOrigin = _.segment.originGet( srcSegment );
  var expected = _.vector.from( [ 0, 1 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcSegment );

  test.case = 'srcSegment 2D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3 ] );
  var gotOrigin = _.segment.originGet( srcSegment );
  var expected = _.vector.from( [ 0, 1 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcSegment );

  test.case = 'srcSegment 3D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3, 4, 5 ];
  var gotOrigin = _.segment.originGet( srcSegment );
  var expected = _.vector.from( [ 0, 1, 2 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcSegment );

  test.case = 'srcSegment 3D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3, 4, 5 ] );
  var gotOrigin = _.segment.originGet( srcSegment );
  var expected = _.vector.from( [ 0, 1, 2 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcSegment );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.originGet( ) );
  test.shouldThrowErrorSync( () => _.segment.originGet( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.originGet( [ 0, 0 ], [ 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.segment.originGet( 'segment' ) );
  test.shouldThrowErrorSync( () => _.segment.originGet( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.originGet( null ) );
  test.shouldThrowErrorSync( () => _.segment.originGet( undefined ) );

}

//

function endPointGet( test )
{
  test.case = 'Source segment remains unchanged'; /* */

  var srcSegment = [ 0, 0, 1, 1 ];
  var expected = _.vector.from( [ 1, 1 ] );

  var gotDirection = _.segment.endPointGet( srcSegment );
  test.identical( gotDirection, expected );

  var oldSrcSegment = [ 0, 0, 1, 1 ];
  test.equivalent( srcSegment, oldSrcSegment );

  test.case = 'srcSegment 1D - array'; /* */

  var srcSegment = [ 0, 1 ];
  var gotDirection = _.segment.endPointGet( srcSegment );
  var expected = _.vector.from( [ 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 1D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1 ] );
  var gotDirection = _.segment.endPointGet( srcSegment );
  var expected = _.vector.from( [ 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 2D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3 ];
  var gotDirection = _.segment.endPointGet( srcSegment );
  var expected = _.vector.from( [ 2, 3 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 2D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3 ] );
  var gotDirection = _.segment.endPointGet( srcSegment );
  var expected = _.vector.from( [ 2, 3 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 3D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3, 4, 5 ];
  var gotDirection = _.segment.endPointGet( srcSegment );
  var expected = _.vector.from( [ 3, 4, 5 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 3D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3, 4, 5 ] );
  var gotDirection = _.segment.endPointGet( srcSegment );
  var expected = _.vector.from( [ 3, 4, 5 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.endPointGet( ) );
  test.shouldThrowErrorSync( () => _.segment.endPointGet( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.endPointGet( [ 0, 0 ], [ 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.segment.endPointGet( 'segment' ) );
  test.shouldThrowErrorSync( () => _.segment.endPointGet( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.endPointGet( null ) );
  test.shouldThrowErrorSync( () => _.segment.endPointGet( undefined ) );

}

//

function directionGet( test )
{
  test.case = 'Source segment remains unchanged'; /* */

  var srcSegment = [ 0, 0, 1, 1 ];
  var expected = _.vector.from( [ 1, 1 ] );

  var gotDirection = _.segment.directionGet( srcSegment );
  test.identical( gotDirection, expected );

  var oldSrcSegment = [ 0, 0, 1, 1 ];
  test.equivalent( srcSegment, oldSrcSegment );

  test.case = 'srcSegment 1D - array'; /* */

  var srcSegment = [ 0, 1 ];
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 1D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1 ] );
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 2D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3 ];
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 2, 2 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 2D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3 ] );
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 2, 2 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 3D - array'; /* */

  var srcSegment = [ 0, 1, 2, 3, 4, 5 ];
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 3, 3, 3 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'srcSegment 3D - vector'; /* */

  var srcSegment = _.vector.fromArray( [ 0, 1, 2, 3, 3, 3 ] );
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 3, 2, 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'Negative direction'; /* */

  var srcSegment = [ 5, 4, 3, 2, 1, 0 ];
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ - 3, - 3, - 3 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  test.case = 'Point'; /* */

  var srcSegment = [ 0, 1, 2, 0, 1, 2 ];
  var gotDirection = _.segment.directionGet( srcSegment );
  var expected = _.vector.from( [ 0, 0, 0 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcSegment );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.directionGet( ) );
  test.shouldThrowErrorSync( () => _.segment.directionGet( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.directionGet( [ 0, 0 ], [ 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.segment.directionGet( 'segment' ) );
  test.shouldThrowErrorSync( () => _.segment.directionGet( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.directionGet( null ) );
  test.shouldThrowErrorSync( () => _.segment.directionGet( undefined ) );

}

//

function segmentAt( test )
{
  test.case = 'Source segment and factor remain unchanged'; /* */

  var srcSegment = [ 0, 0, 1, 1 ];
  var factor = 1;
  var expected = [ 1, 1 ];

  var gotPoint = _.segment.segmentAt( srcSegment, factor );
  test.identical( gotPoint, expected );

  var oldSrcSegment = [ 0, 0, 1, 1 ];
  test.equivalent( srcSegment, oldSrcSegment );

  var oldFactor = 1;
  test.equivalent( factor, oldFactor );

  test.case = 'Factor = 0, return origin'; /* */

  var srcSegment = [ 0, 0, 1, 1 ];
  var factor = 0;
  var expected = [ 0, 0 ];

  var gotPoint = _.segment.segmentAt( srcSegment, factor );
  test.identical( gotPoint, expected );

  test.case = 'Factor = 1, return endPoint'; /* */

  var srcSegment = [ 0, 1, 1, 1 ];
  var factor = 1;
  var expected = [ 1, 1 ];

  var gotPoint = _.segment.segmentAt( srcSegment, factor );
  test.identical( gotPoint, expected );

  test.case = 'Middle of 3D segment'; /* */

  var srcSegment = [ 0, 1, 2, 1, 1, 1 ];
  var factor = 0.5;
  var expected = [ 0.5, 1, 1.5 ];

  var gotPoint = _.segment.segmentAt( srcSegment, factor );
  test.identical( gotPoint, expected );

  test.case = 'factor smaller than 0.5'; /* */

  var srcSegment = [ 0, 1, 2, 2, 2, 2 ];
  var factor = 0.25;
  var expected = [ 0.5, 1.25, 2 ];

  var gotPoint = _.segment.segmentAt( srcSegment, factor );
  test.identical( gotPoint, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentAt( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 0, 0 ], [ 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( 'segment', 1 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 0, 0 ], 'factor') );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( null, 1 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 0, 0, 1, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( undefined, 1 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 1, 1, 2, 2 ], 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentAt( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function getFactor( test )
{

  test.case = 'Segment and Point remain unchanged'; /* */

  var segment = [  - 1,  - 1 , 1, 1 ];
  var point = [ 0, 0 ];
  var expected = 0.5;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor, expected );

  var oldSegment = [  - 1,  - 1 , 1, 1 ];
  test.identical( segment, oldSegment );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null segment contains empty point'; /* */

  var segment = null;
  var point = [ 0, 0, 0 ];
  var expected = 0;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Point segment contains Point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = 0;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Middle of the segment'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var point = [  1, 1, 1 ];
  var expected = 0.5;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected )

  test.case = 'Direction with different values'; /* */

  var segment = [ 0, 0, 0, 1, 2, 3 ];
  var point = [  0.1, 0.2, 0.3 ];
  var expected = 0.1;

  var gotFactor = _.segment.getFactor( segment, point );
  test.equivalent( gotFactor,  expected );

  test.case = 'Direction with different values ( one of them 0 )'; /* */

  var segment = [ 0, 0, 0, 1, 2, 0 ];
  var point = [  0.2, 0.4, 0 ];
  var expected = 0.2;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Segment under point'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var point = [ 1, 1, 3 ];
  var expected = false;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Segment ( normalized to 1 )'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var point = [ 0.500, 0.500, 0.000 ];
  var expected = 1/ Math.sqrt( 2 );

  var gotFactor = _.segment.getFactor( segment, point );
  test.equivalent( gotFactor,  expected );

  test.case = 'Segment of four dimensions'; /* */

  var segment = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1 ];
  var point = [ 0, 0, 0, 0 ];
  var expected = 0.5;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Segment of 7 dimensions'; /* */

  var segment = [ - 2, - 2, - 2, - 2, - 2, - 2, - 2, 1, 1, 1, 1, 1, 1, 1 ];
  var point = [ - 1, -1, -1, -1, -1, -1, -1 ];
  var expected = 1/3;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Segment of 1 dimension contains point'; /* */

  var segment = [ 0, 2 ];
  var point = [ 1 ];
  var expected = 0.5;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Segment of 1 dimension desn´t contain point '; /* */

  var segment = [ 0, 2 ];
  var point = [ - 3 ];
  var expected = false;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  test.case = 'Segment of 1 dimension desn´t contain point '; /* */

  var segment = [ 0, 2 ];
  var point = [ 5 ];
  var expected = false;

  var gotFactor = _.segment.getFactor( segment, point );
  test.identical( gotFactor,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.getFactor( ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( [ 1, 1, 2, 2 ], 'factor') );
  test.shouldThrowErrorSync( () => _.segment.getFactor( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.getFactor( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );

}

//

function segmentParallel( test )
{
  test.case = 'Source segments and accuracySqr remain unchanged'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 0, 0, 0, 2, 2, 2 ];
  var accuracySqr = 1E-10;
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment, accuracySqr );
  test.identical( isParallel, expected );

  var oldSrc1Segment = [ 0, 0, 0, 1, 1, 1 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, 0, 0, 2, 2, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  var oldAccuracySqr = 1E-10;
  test.equivalent( accuracySqr, oldAccuracySqr );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 7, 1, 4, 8, 2 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 7, 1, 6, 10, 4 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel ( different origin - opposite direction )'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 7, 1, 2, 6, 0 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel ( src1Segment is a point )'; /* */

  var src1Segment = [ 3, 7, 1, 3, 7, 1 ];
  var src2Segment = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel ( src2Segment is a point )'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 7, 1, 3, 7, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel ( src2Segment is a point - 4D )'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 7, 1, 1, 3, 7, 1, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are not parallel ( same origin - different direction )'; /* */

  var src1Segment = [ 3, 7, 1, 1, - 1, 1 ];
  var src2Segment = [ 3, 7, 1, 7, 7, 7 ];
  var expected = false;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are perpendicular'; /* */

  var src1Segment = [ 2, 7, 1, 6, 7, 1 ];
  var src2Segment = [ 3, 5, 1, 3, 10, 1 ];
  var expected = false;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel to x'; /* */

  var src1Segment = [ 3, 7, 1, 4, 7, 1 ];
  var src2Segment = [ 3, 7, 1, 6, 7, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel but in a opposite direction'; /* */

  var src1Segment = [ 3, 7, 1, 5, 7, 1 ];
  var src2Segment = [ 3, 7, 1, 2, 7, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel 2D'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are not parallel 2D'; /* */

  var src1Segment = [ 3, 7, 4, 6 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = false;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel 4D'; /* */

  var src1Segment = [ 0, 0, 1, 1, 0, 1, 3, 4 ];
  var src2Segment = [ 3, 7, - 2, - 2, 3, 8, 0, 1 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are not parallel 4D'; /* */

  var src1Segment = [ 3, 7, 1, - 1, 3, 7, 1, 0 ];
  var src2Segment = [ 3, 7, 7, 7, 3, 7, 6, 7 ];
  var expected = false;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are parallel 6D'; /* */

  var src1Segment = [ 0, 0, 1, 1, 1, 1, 0, 1, 2, 3, 4, 5 ];
  var src2Segment = [ 3, 7, - 2, - 2, 0, 0, 3, 8, -1, 0, 3, 4 ];
  var expected = true;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  test.case = 'Segments are not parallel 6D'; /* */

  var src1Segment = [ 0, 0, 1, 1, 1, 1, 0, 1, 2, 3, 4, 5 ];
  var src2Segment = [ 3, 7, - 2, - 2, 0, 0, 0, 2, 8, 6, 8, 10 ];
  var expected = false;

  var isParallel = _.segment.segmentParallel( src1Segment, src2Segment );
  test.identical( isParallel, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( [ 0, 0, 0 ] ) );
   test.shouldThrowErrorSync( () => _.segment.segmentParallel( 'segment', [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( [ 0, 0 ], 'factor') );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( null, [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( undefined, [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( [ 1, 1, 1, 2, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( [ 1, 1, 1, 2, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( [ 1, 1, 1, 2, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentParallel( [ 1, 1, 1, 2, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentIntersectionFactors( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 2, 2 ];
  var expected = _.vector.from( [ 0, 0 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  var oldSrc1Segment = [ 0, 0, 1, 1 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, 0, 2, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 1, 1 ];
  var expected = _.vector.from( [ 0, 0 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 5, 9 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  test.case = 'Segments don´t intersect'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 0, 2, -1 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  test.case = 'Segments intersect in their origin'; /* */

  var src1Segment = [ 3, 7, 4, 7 ];
  var src2Segment = [ 3, 7, 3, 8 ];
  var expected = _.vector.from( [ 0, 0 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Segments intersect '; /* */

  var src1Segment = [ -4, 0, 4, 0 ];
  var src2Segment = [ 0, -6, 0, 6 ];
  var expected = _.vector.from( [ 0.5, 0.5 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Segments are perpendicular '; /* */

  var src1Segment = [ -3, 0, 2, 0 ];
  var src2Segment = [ 0, -2, 0, 1 ];
  var expected = _.vector.from( [ 3/5, 2/3 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Segments 3D intersection'; /* */

  var src1Segment = [ -1, -1, -1, 1, 1, 1 ];
  var src2Segment = [ -1, -1, 0, 4, 4, 0 ];
  var expected = _.vector.from( [ 0.5, 0.2 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Segments 3D intersection 3rd coordinate 0'; /* */

  var src1Segment = [ 0, 0, 0, 2, 2, 0 ];
  var src2Segment = [ 1, 3, 0, 1, 0, 0 ];
  var expected = _.vector.from( [ 0.5, 2/3 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Parallel segments'; /* */

  var src1Segment = [ 0, 0, 0, 2, 2, 0 ];
  var src2Segment = [ 3, 3, 0, 1, 1, 0 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Segments 3D no intersection'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 3, 5, 0, 1, 4 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  test.case = 'Segments 4D intersection'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 3, 3, 3, 0, 0, 0, 0 ];
  var expected = _.vector.from( [ 0, 1 ] );

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.equivalent( isIntersectionFactors, expected );

  test.case = 'Segments 4D no intersection'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 3, 5, 3, 0, 0, 1, 4 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  test.case = 'Segments 4D no intersection out of 3D intersection'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1, 1, -1 ];
  var src2Segment = [ 3, 3, 3, 2, 0, 0, 0, 3 ];
  var expected = 0;

  var isIntersectionFactors = _.segment.segmentIntersectionFactors( src1Segment, src2Segment );
  test.identical( isIntersectionFactors, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( null, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionFactors( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentIntersectionPoints( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ -1, 0, 1, 0 ];
  var src2Segment = [ 0, -1, 0, 2 ];
  var expected = [ [ 0, 0 ], [ 0, 0 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoints, expected );

  var oldSrc1Segment = [ -1, 0, 1, 0 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, -1, 0, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 1, 1 ];
  var expected = [ [ 0, 0 ], [ 0, 0 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 2, 6 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect in their origin'; /* */

  var src1Segment = [ 3, 7, 3, 8 ];
  var src2Segment = [ 3, 7, 4, 7 ];
  var expected = [ [ 3, 7 ], [ 3, 7 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect in their end '; /* */

  var src1Segment = [ 0, 0, 1, 0 ];
  var src2Segment = [ 3, -6, 1, 0 ];
  var expected = [ [ 1, 0 ], [ 1, 0 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments are perpendicular '; /* */

  var src1Segment = [ -3, 0, 1, 0 ];
  var src2Segment = [ 0, -2, 0, 1 ];
  var expected = [ [ 0, 0 ], [ 0, 0 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoints, expected );

  test.case = 'Segments don´t intersect 3D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 0, 2, 2, -1 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect 3D'; /* */

  var src1Segment = [ -1, -1, -1, 2, 2, 5 ];
  var src2Segment = [ 3, 3, 3, - 3, - 3, -1 ];
  var expected = [ [ 0, 0, 1 ], [ 0, 0, 1 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoints, expected );

  test.case = 'Segments 3D intersection 3rd coordinate 0'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 0 ];
  var src2Segment = [ 3, 3, 0, -1, -1, 0 ];
  var expected = [ [ 0, 0, 0 ], [ 0, 0, 0 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments don´t intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 1, 4, 2, 2, 2, -1 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 4, 4, 4, 5 ];
  var src2Segment = [ 3, 3, 3, 3, - 3, - 3, -3, -1 ];
  var expected = [ [ 0, 0, 0, 1 ], [ 0, 0, 0, 1 ] ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoints( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( null, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoints( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentIntersectionPoint( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ -1, 0, 1, 0 ];
  var src2Segment = [ 0, -1, 0, 2 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoints, expected );

  var oldSrc1Segment = [ -1, 0, 1, 0 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, -1, 0, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 1, 1 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 2, 6 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect in their origin'; /* */

  var src1Segment = [ 3, 7, 3, 8 ];
  var src2Segment = [ 3, 7, 4, 7 ];
  var expected = [ 3, 7 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect in their end '; /* */

  var src1Segment = [ 0, 0, 1, 0 ];
  var src2Segment = [ 3, -6, 1, 0 ];
  var expected = [ 1, 0 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments are perpendicular '; /* */

  var src1Segment = [ -3, 0, 1, 0 ];
  var src2Segment = [ 0, -2, 0, 1 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoints, expected );

  test.case = 'Segments don´t intersect 3D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 0, 2, 2, -1 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect 3D'; /* */

  var src1Segment = [ -1, -1, -1, 2, 2, 5 ];
  var src2Segment = [ 3, 3, 3, - 3, - 3, -1 ];
  var expected = [ 0, 0, 1 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoints, expected );

  test.case = 'Segments 3D intersection 3rd coordinate 0'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 0 ];
  var src2Segment = [ 3, 3, 0, -1, -1, 0 ];
  var expected = [ 0, 0, 0 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments don´t intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 1, 4, 2, 2, 2, -1 ];
  var expected = 0;

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  test.case = 'Segments intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 4, 4, 4, 5 ];
  var src2Segment = [ 3, 3, 3, 3, - 3, - 3, -3, -1 ];
  var expected = [ 0, 0, 0, 1 ];

  var isIntersectionPoints = _.segment.segmentIntersectionPoint( src1Segment, src2Segment );
  test.identical( isIntersectionPoints, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( null, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPoint( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentIntersectionPointAccurate( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 2, 2 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  var oldSrc1Segment = [ 0, 0, 1, 1 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, 0, 2, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 1, 1 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = 0;

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 2, 6 ];
  var expected = 0;

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  test.case = 'Segments intersect in their origin'; /* */

  var src1Segment = [ 3, 7, 1, 0 ];
  var src2Segment = [ 3, 7, 0, 1 ];
  var expected = [ 3, 7 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  test.case = 'Segments intersect '; /* */

  var src1Segment = [ -5, 0, 5, 0 ];
  var src2Segment = [ -2, -4, 1, 2 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoint, expected );

  test.case = 'Segments are perpendicular '; /* */

  var src1Segment = [ -3, 0, 1, 0 ];
  var src2Segment = [ 0, -2, 0, 1 ];
  var expected = [ 0, 0 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoint, expected );

  test.case = 'Segments don´t intersect 3D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 1, 2, 2, -1 ];
  var expected = 0;

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  test.case = 'Segments intersect 3D'; /* */

  var src1Segment = [ 0, 0, 0, - 8, - 8, - 8 ];
  var src2Segment = [ - 3, - 7, - 3, - 3, - 1, - 3 ];
  var expected = [ - 3, - 3, - 3 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoint, expected );

  test.case = 'Segments don´t intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 1, 4, 2, 2, 2, -1 ];
  var expected = 0;

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.identical( isIntersectionPoint, expected );

  test.case = 'Segments intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 6, 6, 6, 7 ];
  var src2Segment = [ 3, 3, 3, 2, 0, 0, 0, 2 ];
  var expected = [ 1, 1, 1, 2 ];

  var isIntersectionPoint = _.segment.segmentIntersectionPointAccurate( src1Segment, src2Segment );
  test.equivalent( isIntersectionPoint, expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( null, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersectionPointAccurate( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentIntersects( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 2, 2 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  var oldSrc1Segment = [ 0, 0, 1, 1 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, 0, 2, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 0, 0, 1, 1 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 4, 8 ];
  var expected = false;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 1, 1 ];
  var src2Segment = [ 3, 7, 2, 6 ];
  var expected = false;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments intersect in their origin'; /* */

  var src1Segment = [ 3, 7, 1, 0 ];
  var src2Segment = [ 3, 7, 0, 1 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments intersect '; /* */

  var src1Segment = [ 0, 0, 1, 0 ];
  var src2Segment = [ -2, -6, 1, 2 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments are perpendicular '; /* */

  var src1Segment = [ -3, 0, 1, 0 ];
  var src2Segment = [ 0, -2, 0, 1 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments don´t intersect 3D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 1, 2, 2, -1 ];
  var expected = false;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments intersect 3D'; /* */

  var src1Segment = [ 0, 0, 0, 7, 7, 7 ];
  var src2Segment = [ 3, 1, 3, 3, 6, 3 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments don´t intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 0, 1, 1, 1, 1 ];
  var src2Segment = [ 3, 0, 1, 4, 2, 2, 2, -1 ];
  var expected = false;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  test.case = 'Segments intersect 4D'; /* */

  var src1Segment = [ 0, 0, 0, 1, 8, 8, 8, 9 ];
  var src2Segment = [ 3, 1, 3, 2, 3, 7, 3, 8 ];
  var expected = true;

  var isIntersection = _.segment.segmentIntersects( src1Segment, src2Segment );
  test.identical( isIntersection, expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( null, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentIntersects( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentDistance( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 0, 0, 0, 2, 2, 2 ];
  var expected = 0;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  var oldSrc1Segment = [ 0, 0, 0, 1, 1, 1 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, 0, 0, 2, 2, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 0, 0, 0, 1 ];
  var src2Segment = [ 3, 7, 0, 3, 7, 1 ];
  var expected = Math.sqrt( 58 );

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 0, 0, 0, 0, 0, 1 ];
  var src2Segment = [ 3, 7, 1, 3, 7, 3 ];
  var expected = Math.sqrt( 58 );

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are parallel ( different origin - opposite direction )'; /* */

  var src1Segment = [ 0, 0, 0, 1, 0, 0 ];
  var src2Segment = [ 3, 7, 1, - 4, 7, 1 ];
  var expected = Math.sqrt( 50 );

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'src1Segment is a point'; /* */

  var src1Segment = [ 3, 7, 1, 3, 7, 1 ];
  var src2Segment = [ 0, 0, 0, 1, 1, 1 ];
  var expected = Math.sqrt( 40 );

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'src1Segment end is src2Segment origin'; /* */

  var src1Segment = [ 3, 7, 1, 0, 0, 0 ];
  var src2Segment = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 4, 2, 1, 1, 1 ];
  var src2Segment = [ 0, 4, 2, 1, 1, 1 ];
  var expected = 0;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments intersect 4D'; /* */

  var src1Segment = [ 0, 0, 2, 1, 0, 7, 2, 1 ];
  var src2Segment = [ 3, 4, 2, 1, -1, 4, 2, 1 ];
  var expected = 0;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments don´t intersect 2D'; /* */

  var src1Segment = [ 0, 0, 2, 1 ];
  var src2Segment = [ - 3, - 4, 1, 0 ];
  var expected = Math.sqrt( 0.2 );

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are perpendicular and intersect'; /* */

  var src1Segment = [ 3, 7, -2, 3, 7, 4 ];
  var src2Segment = [ 3, 5, 1, 3, 9, 1 ];
  var expected = 0;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are perpendicular and don´t intersect'; /* */

  var src1Segment = [ 3, 7, 1, 9, 7, 1 ];
  var src2Segment = [ 3, -2, 1, 3, 4, 1 ];
  var expected = 3;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are parallel to x'; /* */

  var src1Segment = [ 3, 7, 1, 6, 7, 1 ];
  var src2Segment = [ 3, 7, 2, 6, 7, 2 ];
  var expected = 1;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'Segments are parallel but in a opposite direction'; /* */

  var src1Segment = [ 3, 7, 1, 1, 7, 1 ];
  var src2Segment = [ 3, 7, 2, 5, 7, 2 ];
  var expected = 1;

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  test.case = 'srcSegment is null'; /* */

  var src1Segment = null;
  var src2Segment = [ 3, 7, 2, 4, 8, 3 ];
  var expected = Math.sqrt( 62 );

  var gotDistance = _.segment.segmentDistance( src1Segment, src2Segment );
  test.identical( gotDistance, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( 'segment', [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( [ 0, 0 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( undefined, [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( [ 1, 1, 1, 2, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( [ 1, 1, 1, 2, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( [ 1, 1, 1, 2, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentDistance( [ 1, 1, 1, 2, 2, 2 ], [ 1, 2 ] ) );

}

//

function segmentClosestPoint( test )
{
  test.case = 'Source segments remain unchanged'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 0, 0, 0, 2, 2, 2 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  var oldSrc1Segment = [ 0, 0, 0, 1, 1, 1 ];
  test.equivalent( src1Segment, oldSrc1Segment );

  var oldSrc2Segment = [ 0, 0, 0, 2, 2, 2 ];
  test.equivalent( src2Segment, oldSrc2Segment );

  test.case = 'Segments are parallel ( different origin - same direction )'; /* */

  var src1Segment = [ 0, 0, 0, 0, 0, 1 ];
  var src2Segment = [ 3, 7, 1, 3, 7, 2 ];
  var expected = [ 0, 0, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments are parallel ( different origin - different direction )'; /* */

  var src1Segment = [ 3, 7, 1, 3, 7, 8 ];
  var src2Segment = [ 0, 0, 0, 0, 0, 0.5 ];
  var expected = [ 3, 7, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments are parallel ( different origin - opposite direction )'; /* */

  var src1Segment = [ 0, 0, 0, 1, 0, 0 ];
  var src2Segment = [ 3, 7, 1, - 7, 7, 1 ];
  var expected = [ 1, 0, 0 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'src1Segment is a point'; /* */

  var src1Segment = [ 3, 7, 1, 3, 7, 1 ];
  var src2Segment = [ 0, 0, 0, 1, 1, 1 ];
  var expected = [ 3, 7, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'src2Segment is a point'; /* */

  var src1Segment = [ 0, 0, 0, 1, 1, 1 ];
  var src2Segment = [ 3, 7, 1, 3, 7, 1 ];
  var expected = [ 1, 1, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.equivalent( gotClosestPoint, expected );

  test.case = 'Segments are the same'; /* */

  var src1Segment = [ 0, 4, 2, 1, 1, 1 ];
  var src2Segment = [ 0, 4, 2, 1, 1, 1 ];
  var expected = [ 0, 4, 2 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments intersect 4D'; /* */

  var src1Segment = [ 0, 0, 2, 1, 0, 7, 2, 1 ];
  var src2Segment = [ 3, 4, 2, 1, -1, 4, 2, 1 ];
  var expected = [ 0, 4, 2, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.equivalent( gotClosestPoint, expected );

  test.case = 'Segments intersect 2D'; /* */

  var src1Segment = [ 0, 0, 2, 0 ];
  var src2Segment = [ - 3, - 4, 1, 0 ];
  var expected = [ 1, 0 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments don´t intersect 2D'; /* */

  var src1Segment = [ 0, 0, 2, 1 ];
  var src2Segment = [ - 3, - 4, 1, 0 ];
  var expected = [ 0.8, 0.4 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments are perpendicular and intersect'; /* */

  var src1Segment = [ 3, 7, 1, 8, 7, 1 ];
  var src2Segment = [ 3, 7, 1, 3, 7, 6 ];
  var expected = [ 3, 7, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments are perpendicular and don´t intersect'; /* */

  var src1Segment = [ 0, 7, 1, 9, 7, 1 ];
  var src2Segment = [ 3, -2, 2, 3, 11, 2 ];
  var expected = [ 3, 7, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments are parallel to x'; /* */

  var src1Segment = [ 3, 7, 1, 6, 7, 1 ];
  var src2Segment = [ 3, 7, 2, 6, 7, 2 ];
  var expected = [ 3, 7, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'Segments are parallel but in a opposite direction'; /* */

  var src1Segment = [ 3, 7, 1, -3, 7, 1 ];
  var src2Segment = [ 3, 7, 2, 8, 7, 1 ];
  var expected = [ 3, 7, 1 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  test.case = 'srcSegment is null'; /* */

  var src1Segment = null;
  var src2Segment = [ 3, 7, 2, - 1, 0, 0 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.segmentClosestPoint( src1Segment, src2Segment );
  test.identical( gotClosestPoint, expected );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( 'segment', [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( [ 0, 0 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( undefined, [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( [ 1, 1, 1, 2, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( [ 1, 1, 1, 2, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( [ 1, 1, 1, 2, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.segmentClosestPoint( [ 1, 1, 1, 2, 2, 2 ], [ 1, 2 ] ) );

}

//

function pointContains( test )
{

  test.case = 'Segment and Point remain unchanged'; /* */

  var segment = [  - 1,  - 1 , 1, 1 ];
  var point = [ 0, 0 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool, expected );

  var oldSegment = [  - 1,  - 1 , 1, 1 ];
  test.identical( segment, oldSegment );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null segment contains empty point'; /* */

  var segment = null;
  var point = [ 0, 0, 0 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Point segment contains Point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment contains point'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var point = [  1, 1, 1 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment under point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 2 ];
  var point = [ 0, 1, 4 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Point closer to origin'; /* */

  var segment = [ 0, 0, 0, 0, 0, 2 ];
  var point = [ 0, 0, -2 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) contains point'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var point = [ 0.500, 0.500, 0.000 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) doesn´t contain point'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var point = [ 0.050, 0.500, - 0.303 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of four dimensions contains point'; /* */

  var segment = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1 ];
  var point = [ 0, 0, 0 , 0 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of four dimensions doesn´t contain point'; /* */

  var segment = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1 ];
  var point = [ 0, - 2, 0 , 2 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of 7 dimensions contains point'; /* */

  var segment = [ - 2, - 2, - 2, - 2, - 2, - 2, - 2, 1, 1, 1, 1, 1, 1, 1 ];
  var point = [ - 1, -1, -1, -1, -1, -1, -1 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of 7 dimensions doesn´t contain point'; /* */

  var segment = [ - 2, - 2, - 2, - 2, - 2, - 2, - 2, 1, 1, 1, 1, 1, 1, 1 ];
  var point = [ 0, 4, 3.5, 0, 5, 2, 2 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of 1 dimension contains point'; /* */

  var segment = [ 0, 2 ];
  var point = [ 1 ];
  var expected = true;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of 1 dimension desn´t contain point '; /* */

  var segment = [ 0, 2 ];
  var point = [ - 3 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );

  test.case = 'Segment of 1 dimension desn´t contain point '; /* */

  var segment = [ 0, 2 ];
  var point = [ 3 ];
  var expected = false;

  var gotBool = _.segment.pointContains( segment, point );
  test.identical( gotBool,  expected );
  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.pointContains( ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.pointContains( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.pointContains( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );

}

//

function pointDistance( test )
{

  test.case = 'Segment and Point remain unchanged'; /* */

  var segment = [  - 1,  - 1 , 1, 1 ];
  var point = [ 0, 0 ];
  var expected = 0;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance, expected );

  var oldSegment = [  - 1,  - 1 , 1, 1 ];
  test.identical( segment, oldSegment );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null segment Distance empty point'; /* */

  var segment = null;
  var point = [ 0, 0, 0 ];
  var expected = 0;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Point segment Distance same Point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = 0;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Point segment Distance other Point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var point = [ 3, 4, 0 ];
  var expected = 5;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment contains point'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var point = [  1, 1, 1 ];
  var expected = 0;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment under point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 2 ];
  var point = [ 0, 1, 4 ];
  var expected = Math.sqrt( 5 );

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Point closer to origin'; /* */

  var segment = [ 0, 0, 0, 0, 0, 2 ];
  var point = [ 0, 0, -2 ];
  var expected = 2;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment ( normalized to 1 ) Distance point'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var point = [ 0.500, 0.500, 0.000 ];
  var expected = 0;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment ( normalized to 1 ) doesn´t contain point'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var point = [ 0.050, 0.500, - 0.303 ];
  var expected = 0.568342039793567;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.equivalent( gotDistance,  expected );

  test.case = 'Segment of four dimensions distance '; /* */

  var segment = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1 ];
  var point = [ 0, 0, 0 , 4 ];
  var expected = Math.sqrt( 12 );

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment of 7 dimensions distance'; /* */

  var segment = [ - 2, - 2, - 2, - 2, - 2, - 2, - 2, 0, 0, 0, 0, 0, 0, 1 ];
  var point = [ 2, 2, 2, 2, 2, 2, 2 ];
  var expected = 5;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment of 1 dimension contains point'; /* */

  var segment = [ 0, 2 ];
  var point = [ 1 ];
  var expected = 0;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );

  test.case = 'Segment of 1 dimension distance'; /* */

  var segment = [ 0, 2 ];
  var point = [ - 3 ];
  var expected = 3;

  var gotDistance = _.segment.pointDistance( segment, point );
  test.identical( gotDistance,  expected );
  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.pointDistance( ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.pointDistance( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );

}

//

function pointClosestPoint( test )
{

  test.case = 'Segment and Point remain unchanged'; /* */

  var segment = [  - 1,  - 1 , 1, 1 ];
  var point = [ 0, 0 ];
  var expected = [ 0, 0 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint, expected );

  var oldSegment = [  - 1,  - 1 , 1, 1 ];
  test.identical( segment, oldSegment );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null segment - empty point'; /* */

  var segment = null;
  var point = [ 0, 0, 0 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Point segment - same Point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Point segment - other Point'; /* */

  var segment = [ 1, 2, 3, 0, 0, 0 ];
  var point = [ 3, 4, 5 ];
  var expected = [ 1, 2, 3 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment contains point'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var point = [ 1, 1, 1 ];
  var expected = [ 1, 1, 1 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment under point'; /* */

  var segment = [ 0, 0, 0, 0, 0, 2 ];
  var point = [ 0, 1, 4 ];
  var expected = [ 0, 0, 2 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Point closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var point = [ - 2, - 2, - 2 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment ( normalized to 1 ) Distance point'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var point = [ 0.500, 0.500, 0.000 ];
  var expected = [ 0.5, 0.5, 0 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment ( normalized to 1 ) doesn´t contain point'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var point = [ 0.050, 0.500, - 0.303 ];
  var expected = [ 0.02572500470627867, 0.10157398765468795, 0.10157398765468795 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.equivalent( gotClosestPoint,  expected );

  test.case = 'Segment of four dimensions distance '; /* */

  var segment = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1 ];
  var point = [ 0, 0, 0 , 4 ];
  var expected = [ 1, 1, 1, 1 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment of 7 dimensions distance'; /* */

  var segment = [ - 2, - 2, - 2, - 2, - 2, - 2, - 2, 0, 0, 0, 0, 0, 0, 1 ];
  var point = [ 2, 2, 2, 2, 2, 2, 2 ];
  var expected = [ 0, 0, 0, 0, 0, 0, 1 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment of 1 dimension contains point'; /* */

  var segment = [ 0, 2 ];
  var point = [ 1 ];
  var expected = [ 1 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment of 1 dimension distance'; /* */

  var segment = [ 0, 2 ];
  var point = [ - 3 ];
  var expected = [ 0 ];

  var gotClosestPoint = _.segment.pointClosestPoint( segment, point );
  test.identical( gotClosestPoint,  expected );
  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( [ 1, 1, 2, 2 ], 'segment') );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.pointClosestPoint( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );

}

//

function boxIntersects( test )
{

  test.case = 'Segment and box remain unchanged'; /* */

  var segment = [  - 1,  - 1, -1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool, expected );

  var oldSegment = [  - 1, - 1, -1, 1, 1, 1 ];
  test.identical( segment, oldSegment );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null segment - empty box'; /* */

  var segment = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'point segment - same box'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'point segment - no intersection'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var box = [ 1, 2, 4, 3, 4, 0 ];
  var expected = false;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'point segment in box'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment and box intersect'; /* */

  var segment = [ -2, -2, -2, 2, 2, 2 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment over box'; /* */

  var segment = [ 0, 0, 4, 0, 0, 6 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = false;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'box closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = false;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) intersection'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var box = [ 0.500, 0.123, 0, 0.734, 0.900, 0.837 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) doesn´t intersect with box'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var box = [ 0.12322, 0.03232, 0, 0.050, 0.500, - 0.303 ];
  var expected = false;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.equivalent( gotBool,  expected );

  test.case = '2D intersection'; /* */

  var segment = [ 0, 0, 2, 2 ];
  var box = [ 1, 2, 3, 4 ];
  var expected = true;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );

  test.case = '2D no intersection'; /* */

  var segment = [ 0, 0, 2, -2 ];
  var box = [ 1, 2, 3, 4 ];
  var expected = false;

  var gotBool = _.segment.boxIntersects( segment, box );
  test.identical( gotBool,  expected );


  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.boxIntersects( ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( [ 1, 1, 2, 2 ], 'box') );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.boxIntersects( [ 1, 1, 2, 2 ], - 2 ) );

}

//

function boxDistance( test )
{
  test.case = 'Segment and box remain unchanged'; /* */

  var segment = [  - 1,  - 1, -1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool, expected );

  var oldSegment = [  - 1, - 1, -1, 1, 1, 1 ];
  test.identical( segment, oldSegment );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null segment - empty box'; /* */

  var segment = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'box segment - same box'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'point segment'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var box = [ 1, 2, 4, 3, 4, 5 ];
  var expected = 1;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'point segment in box'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = 0;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment and box intersect'; /* */

  var segment = [ -2, -2, -2, 2, 2, 2 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment over box'; /* */

  var segment = [ 0, 0, 4, 0, 0, 6 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = Math.sqrt( 2 );

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'box corner closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = Math.sqrt( 3 );

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'box side closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var box = [ -1, -1, -1, 0.5, 0.5, - 0.1 ];
  var expected = 0.1;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) intersection'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var box = [ 0.500, 0.123, 0, 0.734, 0.900, 0.837 ];
  var expected = 0;

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) doesn´t contain box'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var box = [ 0.12322, 0.03232, 0, 0.050, 0.500, 0.303 ];
  var expected = 0.04570949385069674;

  var gotBool = _.segment.boxDistance( segment, box );
  test.equivalent( gotBool,  expected );

  test.case = '2D'; /* */

  var segment = [ 2, 2, 2, 2 ];
  var box = [ 0, 0, 1, 1 ];
  var expected = Math.sqrt( 2 );

  var gotBool = _.segment.boxDistance( segment, box );
  test.identical( gotBool,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.boxDistance( ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( [ 1, 1, 2, 2 ], 'box') );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.boxDistance( [ 1, 1, 2, 2 ], - 2 ) );

}

//

function boxClosestPoint( test )
{
  test.case = 'Segment and box remain unchanged'; /* */

  var segment = [  - 1,  - 1, -1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint, expected );

  var oldSegment = [  - 1, - 1, -1, 1, 1, 1 ];
  test.identical( segment, oldSegment );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null segment - empty box'; /* */

  var segment = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'box segment - same box'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'point segment'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var box = [ 1, 2, 4, 3, 4, 0 ];
  var expected = [ 1, 2, 3 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'point segment in box'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = 0;

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'Segment and box intersect'; /* */

  var segment = [ -2, -2, -2, 2, 2, 2 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'Segment over box'; /* */

  var segment = [ 0, 0, 4, 0, 0, 6 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = [ 0, 0, 4 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'box corner closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = [ 0, 0, 0 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'box side closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var box = [ -1, -1, -1, 0.5, 0.5, - 0.1 ];
  var expected = [ 0, 0, 0 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'box corner closer to end'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var box = [ 6, 7, 8, 6, 9, 10 ];
  var expected = [ 2, 2, 2 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'Segment ( normalized to 1 ) intersection'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var box = [ 0.500, 0.123, 0, 0.734, 0.900, 0.837 ];
  var expected = 0;

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  test.case = 'Segment ( normalized to 1 ) doesn´t contain box'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var box = [ 0.12322, 0.03232, 0, 0.050, 0.500, - 0.303 ];
  var expected = [ 0.005519293548276563, 0.021792674525669315, 0.021792674525669315 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.equivalent( gotPoint,  expected );

  test.case = '2D'; /* */

  var segment = [ 0, 0, 2, 10 ];
  var box = [ 6, 7, 10, 8 ];
  var expected = [ 1.7692307692307692, 8.846153846153847 ];

  var gotPoint = _.segment.boxClosestPoint( segment, box );
  test.identical( gotPoint,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( 'segment', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( [ 1, 1, 2, 2 ], 'box') );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.boxClosestPoint( [ 1, 1, 2, 2 ], - 2 ) );

}

//

function sphereIntersects( test )
{

  test.case = 'Segment and sphere remain unchanged'; /* */

  var segment = [  - 1,  - 1, -1, 1, 1, 1 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = true;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool, expected );

  var oldSegment = [  - 1, - 1, -1, 1, 1, 1 ];
  test.identical( segment, oldSegment );

  var oldSphere = [ 0, 0, 0, 1 ];
  test.identical( sphere, oldSphere );

  test.case = 'Null segment - empty sphere'; /* */

  var segment = null;
  var sphere = [ 0, 0, 0, 1 ];
  var expected = true;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'point segment center of sphere'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = true;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'point segment - no intersection'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var sphere = [ 4, 3, 4, 1 ];
  var expected = false;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'point segment in sphere'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var sphere = [ 2, 2, 2, 2 ];
  var expected = true;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'Segment and sphere intersect'; /* */

  var segment = [ -2, -2, -2, 2, 2, 2 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = true;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'Segment over sphere'; /* */

  var segment = [ 0, -6, 4, 0, 1, 4 ];
  var sphere = [ 0, 0, 0, 3 ];
  var expected = false;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'sphere closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var sphere = [ - 2, - 2, - 2, 0.5 ];
  var expected = false;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) intersection'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var sphere = [ 0, 2, 0, 2 ];
  var expected = true;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.identical( gotBool,  expected );

  test.case = 'Segment ( normalized to 1 ) no intersection'; /* */

  var segment = [ 0, 0, 0, 0.194, 0.766, 0.766 ];
  var sphere = [ 3, 3, 3, 1 ];
  var expected = false;

  var gotBool = _.segment.sphereIntersects( segment, sphere );
  test.equivalent( gotBool,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( 'segment', [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( [ 1, 1, 1, 2, 2, 2 ], 'sphere') );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( [ 1, 1, 1, 2, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( [ 1, 1, 1, 2, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( [ 1, 1, 1, 2, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.sphereIntersects( [ 1, 1, 1, 2, 2, 2 ], [ 1, 2, 3, 4, 5, 6 ] ) );

}

//

function sphereDistance( test )
{

  test.case = 'Segment and sphere remain unchanged'; /* */

  var segment = [  - 1,  - 1, -1, 1, 1, 1 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance, expected );

  var oldSegment = [  - 1, - 1, -1, 1, 1, 1 ];
  test.identical( segment, oldSegment );

  var oldSphere = [ 0, 0, 0, 1 ];
  test.identical( sphere, oldSphere );

  test.case = 'Null segment - empty sphere'; /* */

  var segment = null;
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'point segment center of sphere'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'point segment - no intersection'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var sphere = [ 4, 3, 4, 1 ];
  var expected = Math.sqrt( 11 ) - 1;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'point segment in sphere'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var sphere = [ 2, 2, 2, 2 ];
  var expected = 0;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'Segment and sphere intersect'; /* */

  var segment = [ -2, -2, -2, 2, 2, 2 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'Segment over sphere'; /* */

  var segment = [ 0, -6, 4, 0, 1, 4 ];
  var sphere = [ 0, 0, 0, 3 ];
  var expected = 1;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'sphere closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var sphere = [ - 2, - 2, - 2, 0.5 ];
  var expected = Math.sqrt( 12 ) - 0.5;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'Segment ( normalized to 1 ) intersection'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var sphere = [ 0, 2, 0, 2 ];
  var expected = 0;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.identical( gotDistance,  expected );

  test.case = 'Segment ( normalized to 1 ) no intersection'; /* */

  var segment = [ 0, 0, 0, 0, 0, 1 ];
  var sphere = [ 3, 0, 0, 1 ];
  var expected = 2;

  var gotDistance = _.segment.sphereDistance( segment, sphere );
  test.equivalent( gotDistance,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.sphereDistance( ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( 'segment', [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( [ 1, 1, 1, 2, 2, 2 ], 'sphere') );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( [ 1, 1, 1, 2, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( [ 1, 1, 1, 2, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( [ 1, 1, 1, 2, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.sphereDistance( [ 1, 1, 1, 2, 2, 2 ], [ 1, 2, 3, 4, 5, 6 ] ) );

}

//

function sphereClosestPoint( test )
{

  test.case = 'Segment and sphere remain unchanged'; /* */

  var segment = [  - 1,  - 1, -1, 1, 1, 1 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint, expected );

  var oldSegment = [  - 1, - 1, -1, 1, 1, 1 ];
  test.identical( segment, oldSegment );

  var oldSphere = [ 0, 0, 0, 1 ];
  test.identical( sphere, oldSphere );

  test.case = 'Null segment - empty sphere'; /* */

  var segment = null;
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'point segment center of sphere'; /* */

  var segment = [ 0, 0, 0, 0, 0, 0 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'point segment - no intersection'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var sphere = [ 4, 3, 4, 1 ];
  var expected = [ 1, 2, 3 ];

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'point segment in sphere'; /* */

  var segment = [ 1, 2, 3, 1, 2, 3 ];
  var sphere = [ 2, 2, 2, 2 ];
  var expected = 0;

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment and sphere intersect'; /* */

  var segment = [ -2, -2, -2, 2, 2, 2 ];
  var sphere = [ 0, 0, 0, 1 ];
  var expected = 0;

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment over sphere'; /* */

  var segment = [ 0, -6, 4, 0, 1, 4 ];
  var sphere = [ 0, 0, 0, 3 ];
  var expected = [ 0, 0, 4 ];

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'sphere closer to origin'; /* */

  var segment = [ 0, 0, 0, 2, 2, 2 ];
  var sphere = [ - 2, - 2, - 2, 0.5 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment ( normalized to 1 ) intersection'; /* */

  var segment = [ 0, 0, 0, 1/ Math.sqrt( 2 ), 1/ Math.sqrt( 2 ), 0 ];
  var sphere = [ 0, 2, 0, 2 ];
  var expected = 0;

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Segment ( normalized to 1 ) no intersection'; /* */

  var segment = [ 0, 0, 0, 0, 0, 1 ];
  var sphere = [ 3, 0, 0, 1 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere );
  test.equivalent( gotClosestPoint,  expected );

  test.case = 'dstPoint is vector'; /* */

  var segment = [ 0, -6, 4, 0, 1, 4 ];
  var sphere = [ 0, 5, 0, 3 ];
  var dstPoint = _.vector.from( [ 0, 0, 0 ] );
  var expected = _.vector.from( [ 0, 1, 4 ] );

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere, dstPoint );
  test.identical( gotClosestPoint,  expected );

  test.case = 'dstPoint is array'; /* */

  var segment = [ 0, -6, 4, 0, 1, 4 ];
  var sphere = [ 1, 5, 0, 3 ];
  var dstPoint = [ 0, 0, 0 ];
  var expected = [ 0, 1, 4 ];

  var gotClosestPoint = _.segment.sphereClosestPoint( segment, sphere, dstPoint );
  test.identical( gotClosestPoint,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( 'segment', [ 1, 1, 1, 2, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( [ 1, 1, 1, 2, 2, 2 ], 'sphere') );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( [ 1, 1, 1, 2, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( [ 1, 1, 1, 2, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( [ 1, 1, 1, 2, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.segment.sphereClosestPoint( [ 1, 1, 1, 2, 2, 2 ], [ 1, 2, 3, 4, 5, 6 ] ) );

}




// --
// define class
// --

var Self =
{

  name : 'Tools/Math/Segment',
  silencing : 1,
  enabled : 1,
  accuracy : 1E-6,
  // routine: 'is',

  tests :
  {
    make : make,
    makeZero : makeZero,
    makeNil : makeNil,

    zero : zero,
    nil : nil,

    from: from,
    _from : _from,

    is : is,
    dimGet : dimGet,
    originGet : originGet,
    endPointGet : endPointGet,
    directionGet : directionGet,

    segmentAt : segmentAt,
    getFactor : getFactor,

    segmentParallel : segmentParallel,

    segmentIntersectionFactors : segmentIntersectionFactors,
    segmentIntersectionPoints : segmentIntersectionPoints,
    segmentIntersectionPoint : segmentIntersectionPoint,
    segmentIntersectionPointAccurate : segmentIntersectionPointAccurate,

    segmentIntersects : segmentIntersects,
    segmentDistance : segmentDistance,
    segmentClosestPoint : segmentClosestPoint,

    pointContains : pointContains,
    pointDistance : pointDistance,
    pointClosestPoint : pointClosestPoint,

    boxIntersects : boxIntersects,
    boxDistance : boxDistance,
    boxClosestPoint : boxClosestPoint,

    sphereIntersects : sphereIntersects,
    sphereDistance : sphereDistance,
    sphereClosestPoint : sphereClosestPoint,
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
