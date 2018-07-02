( function _Euler_test_s_( ) {

'use strict';

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
var Parent = _.Tester;

var avector = _.avector;
var vector = _.vector;
var pi = Math.PI;
var sin = Math.sin;
var cos = Math.cos;
var atan2 = Math.atan2;
var asin = Math.asin;
var sqr = _.sqr;
var sqrt = _.sqrt;
var clamp = _.clamp;

_.assert( sqrt );

// --
// test
// --

function is( test )
{

  test.description = 'array'; //

  test.is( !_.euler.is([]) );
  test.is( !_.euler.is([ 0 ]) );
  test.is( !_.euler.is([ 0,0 ]) );
  test.is( !_.euler.is([ 0,0,0 ]) );
  test.is( !_.euler.is([ 0,0,0,0 ]) );
  test.is( !_.euler.is([ 0,0,0,0,0 ]) );
  test.is( _.euler.is([ 0,0,0,0,0,0 ]) );
  test.is( _.euler.is([ 1,2,3,0,1,2 ]) );
  test.is( !_.euler.is([ 0,0,0,0,0,0,0 ]) );

  test.description = 'vector'; //

  test.is( !_.euler.is( _.vector.fromArray([]) ) );
  test.is( !_.euler.is( _.vector.fromArray([ 0 ]) ) );
  test.is( !_.euler.is( _.vector.fromArray([ 0,0 ]) ) );
  test.is( !_.euler.is( _.vector.fromArray([ 0,0,0 ]) ) );
  test.is( !_.euler.is( _.vector.fromArray([ 0,0,0,0 ]) ) );
  test.is( !_.euler.is( _.vector.fromArray([ 0,0,0,0,0 ]) ) );
  test.is( _.euler.is( _.vector.fromArray([ 0,0,0,0,0,0 ]) ) );
  test.is( _.euler.is( _.vector.fromArray([ 1,2,3,0,1,2 ]) ) );
  test.is( !_.euler.is( _.vector.fromArray([ 0,0,0,0,0,0,0 ]) ) );

  test.description = 'not euler'; //

  test.is( !_.euler.is( 'abcdef' ) );
  test.is( !_.euler.is( {} ) );
  test.is( !_.euler.is( function( a,b,c,d,e,f ){} ) );

}

//

function isZero( test )
{

  test.description = 'zero'; //

  debugger;
  test.is( _.euler.isZero([ 0,0,0,0,1,2 ]) );

  test.description = 'not zero'; //

  test.is( !_.euler.isZero([ 1,0,0,0,1,2 ]) );
  test.is( !_.euler.isZero([ 0,1,0,0,1,2 ]) );
  test.is( !_.euler.isZero([ 0,0,1,0,1,2 ]) );

  test.is( !_.euler.isZero([ 1,1,1,0,0,0 ]) );

}

//

function make( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.euler.make( src );
  var expected = [ 0,0,0,0,1,2 ];
  test.identical( got,expected );
  test.is( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.euler.make( src );
  var expected = [ 0,0,0,0,1,2 ];
  test.identical( got,expected );
  test.is( got !== src );

  test.description = 'src array'; //

  var src = [ 0,1,2,5,5,5 ];
  var got = _.euler.make( src );
  var expected = [ 0,1,2,5,5,5 ];
  test.identical( got,expected );
  test.is( got !== src );

  test.description = 'src vector'; //

  var src = _.vector.fromArray([ 0,1,2,5,5,5 ]);
  var got = _.euler.make( src );
  var expected = [ 0,1,2,5,5,5 ];
  test.identical( got,expected );
  test.is( got !== src );

  test.description = 'bad arguments'; //

  test.shouldThrowErrorSync( () => _.euler.make( 0 ) );
  test.shouldThrowErrorSync( () => _.euler.make( 4 ) );
  test.shouldThrowErrorSync( () => _.euler.make( '4' ) );
  test.shouldThrowErrorSync( () => _.euler.make( [ 0,0,0,0,1,2 ],2 ) );

}

//

function makeZero( test )
{

  test.description = 'trivial'; //

  var got = _.euler.makeZero();
  var expected = [ 0,0,0,0,1,2 ];
  test.identical( got,expected );

  if( !Config.debug )
  return;

  test.description = 'bad arguments'; //

  test.shouldThrowErrorSync( () => _.euler.makeZero( undefined ) );
  test.shouldThrowErrorSync( () => _.euler.makeZero( null ) );
  test.shouldThrowErrorSync( () => _.euler.makeZero( 4 ) );
  test.shouldThrowErrorSync( () => _.euler.makeZero([ 0,0,0,0,1,2 ]) );
  test.shouldThrowErrorSync( () => _.euler.makeZero( '4' ) );
  test.shouldThrowErrorSync( () => _.euler.makeZero( [ 0,0,0,0,1,2 ],2 ) );

}

//

function zero( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.euler.zero( src );
  var expected = [ 0,0,0,0,1,2 ];
  test.identical( got,expected );
  test.is( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.euler.zero( src );
  var expected = [ 0,0,0,0,1,2 ];
  test.identical( got,expected );
  test.is( got !== src );

  test.description = 'dst array'; //

  var dst = [ 0,1,2,5,5,5 ];
  var got = _.euler.zero( dst );
  var expected = [ 0,0,0,5,5,5 ];
  test.identical( got,expected );
  test.is( got === dst );

  test.description = 'dst vector'; //

  var dst = _.vector.fromArray([ 0,1,2,5,5,5 ]);
  var got = _.euler.zero( dst );
  var expected = _.vector.fromArray([ 0,0,0,5,5,5 ]);
  test.identical( got,expected );
  test.is( got === dst );

  test.description = 'bad arguments'; //

  test.shouldThrowErrorSync( () => _.euler.zero( 4 ) );
  test.shouldThrowErrorSync( () => _.euler.zero([ 0,0,0 ]) );
  test.shouldThrowErrorSync( () => _.euler.zero( '4' ) );
  test.shouldThrowErrorSync( () => _.euler.zero( [ 0,0,0,5,5,5 ],2 ) );

}

//

function fromAxisAndAngle( test )
{

  function sampleTest()
  {

    // var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
    // var euler1 = [ 1.7518, 0.0004, 1.7926, 2, 1, 0 ];

    // var dst = [ 0,0,0,0,1,2 ]
    // var got = _.euler.fromAxisAndAngle( dst,axisAndAngle );
    // test.identical( got,expected );
    // test.is( got === dst );

    var dst = expected.slice();
    dst[ 0 ] = 0;
    dst[ 1 ] = 0;
    dst[ 2 ] = 0;

    var euler1 = _.euler.fromAxisAndAngle( dst,axisAndAngle1 );
    var quat1 = _.quat.fromEuler( null,euler1 );
    debugger;
    var quat2 = _.quat.fromAxisAndAngle( null,axisAndAngle1 );
    debugger;

    var appliedQuat1 = _.quat.applyTo( quat1,[ 0.25,0.5,1 ] );
    var appliedQuat2 = _.quat.applyTo( quat2,[ 0.25,0.5,1 ] );

    test.is( euler1 === dst );
    test.equivalent( euler1,expected );
    test.equivalent( appliedQuat1,appliedQuat2 );

    logger.log( 'quat1',quat1 );
    logger.log( 'quat2',quat2 );
    logger.log( 'euler1',euler1 );
    logger.log( 'axisAndAngle1',axisAndAngle1 );
    logger.log( 'expected',expected );

  }

  // test.description = 'trivial xyz';
  //
  // var axisAndAngle = [ 1 / sqrt( 3 ),1 / sqrt( 3 ),1 / sqrt( 3 ),0.5 ];
  // var expected = [ 0.25152005616932893, 0.32319976617576235, 0.25152005616932893, 0, 1, 2 ];
  // var dst = [ 0,0,0,0,1,2 ]
  // var got = _.euler.fromAxisAndAngle( dst,axisAndAngle );
  // test.identical( got,expected );
  // test.is( got === dst );

  test.description = 'trivial xyz';

  var axisAndAngle1 = [ 0.3, 0.7, 0.6480740698407861, 0.5 ];
  var expected = [ 0.25152005616932893, 0.32319976617576235, 0.25152005616932893, 0, 1, 2 ];
  sampleTest();

}

//

function fromQuat( test )
{

  function sampleTest()
  {

    // var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
    // var euler1 = [ 1.7518, 0.0004, 1.7926, 2, 1, 0 ];

    var dst = expected.slice();
    dst[ 0 ] = 0;
    dst[ 1 ] = 0;
    dst[ 2 ] = 0;

    var euler1 = _.euler.fromQuat( dst,quat1 );
    var quat2 = _.quat.fromEuler( null,euler1 );

    var appliedQuat1 = _.quat.applyTo( quat1,[ 0.25,0.5,1 ] );
    var appliedQuat2 = _.quat.applyTo( quat2,[ 0.25,0.5,1 ] );

    test.equivalent( euler1,expected );
    test.equivalent( appliedQuat1,appliedQuat2 );
    test.is( euler1 === dst );

    // logger.log( 'quat1',quat1 );
    // logger.log( 'quat2',quat2 );
    // logger.log( 'appliedQuat1',appliedQuat1 );
    // logger.log( 'appliedQuat2',appliedQuat2 );
    // logger.log( 'expected',expected );
    // logger.log( 'euler1',euler1 );

    // function variateRoutine( v )
    // {
    //
    //   if( !_.arrayHasAll( [ v.ox0, v.oy0, v.oz0, v.ow0, v.ox1, v.oy1, v.oz1, v.ow1 ], [ 0,1,2,3, 4,5,6,7 ] ) )
    //   return;
    //
    //   var q = _.quat.fromEuler( null, euler1.slice(), v );
    //   var r = _.quat.applyTo( q,[ 0.25,0.5,1 ] );
    //
    //   return r;
    // }
    //
    // function vtest( got,o )
    // {
    //   if( got === undefined )
    //   return false;
    //   return _.entityEquivalent( got,o.expected,{ /*eps*/accuracy : o./*eps*/accuracy } );
    // }
    //
    // console.log( test.description );
    // _.diagnosticVariate
    // ({
    //   routine : variateRoutine,
    //   test : vtest,
    //   expected : appliedQuat1,
    //   variates : _.quat.fromEuler.variates,
    //   /*eps*/accuracy : 1e-4,
    // });

  }

  test.description = 'trivial xyz'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ -0.8768166446364086, 1.2855172555584793, 2.4682396612065283, 0, 1, 2 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ 0.07661016491652753, 0.73448367317603, 0.9774169729318261, 0, 1, 2 ];
  sampleTest();

  test.description = 'trivial xzy'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.611438122848755, 0.1764134071967898, 1.79616768779864, 0, 2, 1 ];

  sampleTest();

  test.description = 'trivial yxz'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.3853696932905102, -0.21805744508021838, 1.611777990662973, 1, 0, 2 ];

  sampleTest();

  test.description = 'trivial yzx'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ -3.139697893726683, 1.3489814514664218, -1.7536311318816715, 1, 2, 0 ];

  sampleTest();

  test.description = 'trivial zxy'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.7948888079254575, 1.3898093848622433, -0.0023158162419024777, 2, 0, 1 ];

  sampleTest();

  test.description = 'trivial zyx'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.7926108168855637, -0.0004168476808001178, 1.3898098596500965, 2, 1, 0 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ 1.1190534595035637, 0.31540765161226797, 0.6786858260419525, 2, 1, 0 ];
  sampleTest();

  //

  test.description = 'trivial xyx'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.5712236437976341, 1.792610797291691, -0.1808924573987528, 0, 1, 0 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ 1.2228685618221453, 1.1428535238213908, -0.7427188846725128, 0, 1, 0 ];
  sampleTest();

  test.description = 'trivial xzx'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 0.0004273170027373423, 1.792610797291691, 1.3899038693961439, 0, 2, 0 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ -0.3479277649727513, 1.1428535238213908, 0.8280774421223838, 0, 2, 0 ];
  sampleTest();

  test.description = 'trivial yxy'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ -0.17655619363859168, 1.6108070011488855, 1.7890312528560666, 1, 0, 1 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ -0.8006624116228127, 1.0297886775455747, 1.5044815828085223, 1, 0, 1 ];
  sampleTest();

  test.description = 'trivial yzy'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.394240133156305, 1.6108070011488855, 0.2182349260611697, 1, 2, 1 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ 0.770133915172084, 1.0297886775455747, -0.06631474398637426, 1, 2, 1 ];
  sampleTest();

  test.description = 'trivial zxz'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 1.7925345384125673, 1.389809875548349, 0.00042376926987936647, 2, 0, 2 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ 1.486244067362877, 0.7377259684532488, -0.47934337913178104, 2, 0, 2 ];

  sampleTest();

  test.description = 'trivial zyz'; /* */

  var quat1 = [ 0.4,0.5,0.6,0.4795831523312719 ];
  var expected = [ 0.22173821161767063, 1.389809875548349, 1.5712200960647762, 2, 1, 2 ];
  sampleTest();

  var quat1 = [ 0.2, 0.3, 0.45, 0.8170067319184096 ];
  var expected = [ -0.0845522594320196, 0.7377259684532488, 1.0914529476631156, 2, 1, 2 ];
  sampleTest();

  //

  test.description = 'trivial xzy';

  var quat1 = [ 1 / sqrt( 3 ),1 / sqrt( 3 ),1 / sqrt( 3 ),0 ];
  var expected = [ 2.0344439357957027, -0.7297276562269666, 2.0344439357957027, 0, 2, 1 ];
  sampleTest();

  /* */

  test.description = 'trivial yxz';

  var quat1 = [ 1 / sqrt( 3 ),1 / sqrt( 3 ),1 / sqrt( 3 ),0 ];
  var expected = [  2.0344439357957027, -0.7297276562269666,2.0344439357957027, 1, 0, 2 ];
  sampleTest();

  /* */

  test.description = 'trivial yzx';

  var quat1 = [ 1 / sqrt( 3 ),1 / sqrt( 3 ),1 / sqrt( 3 ),0 ];
  var expected = [ -2.0344439357957027, 0.7297276562269666, -2.0344439357957027, 1, 2, 0 ];
  sampleTest();

  /* */

  test.description = 'trivial zxy';

  var quat1 = [ 1 / sqrt( 3 ),1 / sqrt( 3 ),1 / sqrt( 3 ),0 ];
  var expected = [ -2.0344439357957027, 0.7297276562269666, -2.0344439357957027, 2, 0, 1 ];
  sampleTest();

  /* */

  test.description = 'trivial zyx';

  var quat1 = [ 1 / sqrt( 3 ),1 / sqrt( 3 ),1 / sqrt( 3 ),0 ];
  var expected = [ 2.0344439357957027, -0.7297276562269666, 2.0344439357957027, 2, 1, 0 ];
  sampleTest();

  //

  test.description = 'trivial xyx';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 2.5989535513401405, 2.636232143305636, 0.5426391022496527, 0, 1, 0 ];
  sampleTest();

  /* */

  test.description = 'trivial xzx';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 1.028157224545244, 2.636232143305636, 2.113435429044549, 0, 2, 0 ];
  sampleTest();

  /* */

  test.description = 'trivial yxy';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 0.2928427717285755, 2.0943951023931957, 2.8487498818612176, 1, 0, 1 ];
  sampleTest();

  /* */

  test.description = 'trivial yzy';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 1.8636390985234723, 2.0943951023931957, 1.277953555066321, 1, 2, 1 ];
  sampleTest();

  /* */

  test.description = 'trivial zxz';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 2.677945044588987, 1.1863995522992576, 0.4636476090008061, 2, 0, 2 ];
  sampleTest();

  /* */

  test.description = 'trivial zyz';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 1.1071487177940904, 1.1863995522992576, 2.0344439357957027, 2, 1, 2 ];
  sampleTest();

  //

  test.description = 'trivial xyz';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ -1.1460587478032058, 0.4274791332848927, -2.8632929945846817, 0, 1, 2 ];
  sampleTest();

  test.description = 'trivial xzy';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 2.113435429044549, -0.25268025514207865, 2.6991209725017002, 0, 2, 1 ];
  sampleTest();

  test.description = 'trivial yxz';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 0.8354818739782282, -0.9775965506452678, 2.677945044588987, 1, 0, 2 ];
  sampleTest();

  test.description = 'trivial yzx';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ -2.6991209725017002, 0.25268025514207865, -2.113435429044549, 1, 2, 0 ];
  sampleTest();

  test.description = 'trivial zxy';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ -2.677945044588987, 0.9775965506452678, -0.8354818739782282, 2, 0, 1 ];
  sampleTest();

  test.description = 'trivial zyx';

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var expected = [ 2.8632929945846817, -0.4274791332848927, 1.1460587478032058, 2, 1, 0 ];
  sampleTest();

}

//

function fromMatrix( test )
{

  test.description = 'trivial xyz'; /* */

  var quat1 = [ 0.25,0.5,0.82915619758885,0 ];
  var m1 = _.quat.toMatrix( quat1,null );
  var euler1 = _.euler.fromMatrix( [ 0,0,0, 0,1,2 ],m1 ); /* x */
  var euler2 = _.euler.fromQuat( [ 0,0,0, 0,1,2 ],quat1 ); /* x */
  var m2 = _.euler.toMatrix( euler1,null ); /* x */
  var euler3 = _.euler.fromMatrix( [ 0,0,0, 0,1,2 ],m2 ); /* x */

// m1
// 0.593, -0.634, 0.496,
// 0.647, 0.742, 0.175,
// -0.479, 0.217, 0.850,

  var quat2 = _.quat.fromEuler( null,euler1 );
  var quat3 = _.quat.fromEuler( null,euler2 );

  var quat1applied = _.quat.applyTo( quat1,[ 1.0,0.5,0.25 ] ); /* + */
  var quat2applied = _.quat.applyTo( quat2,[ 1.0,0.5,0.25 ] );
  var quat3applied = _.quat.applyTo( quat3,[ 1.0,0.5,0.25 ] );
  var m1applied = m1.matrixApplyTo([ 1.0,0.5,0.25 ]); /* + */
  var m2applied = m2.matrixApplyTo([ 1.0,0.5,0.25 ]);

  test.equivalent( m1applied,quat1applied );
  test.equivalent( m2applied,quat1applied );

  logger.log( 'm1',m1 );
  logger.log( 'm2',m2 );

  logger.log( 'quat1applied',quat1applied );
  logger.log( 'quat2applied',quat2applied );
  logger.log( 'quat3applied',quat3applied );
  logger.log( 'm1applied',m1applied );
  logger.log( 'm2applied',m2applied );

  logger.log( 'euler1',euler1 );
  logger.log( 'euler2',euler2 );
  logger.log( 'euler3',euler3 );

  logger.log( 'quat1',quat1 );
  logger.log( 'quat2',quat2 );
  logger.log( 'quat3',quat3 );

}

//

function toMatrix( test )
{

  // test.description = 'special zyx'; /* */
  //
  // // var euler = [ -1.1460588,0.4274791,-2.863293,2,1,0 ];
  // // var euler = [ 0.50496801411559,-0.427479133284893,2.89661399046293,2,1,0 ];
  // // var euler = [ 0.25,0.5,0.82915619758885,2,1,0 ];
  //
  // var euler = [ 2.8633, -0.4275, 1.1461, 2,1,0 ]
  // var m1 = _.euler.toMatrix( euler,null );
  //
  // var expected = [ 0,0,0 ];
  // var applied = m1.matrixApplyTo([ 0.25,0.5,1.0 ]);
  //
  // var quat1 = _.quat.fromEuler( null,euler );
  // var quat2 = _.quat.fromMatrixRotation( null,m1 );
  // var m2 = _.quat.toMatrix( quat1 );
  //
  // var applied1 = _.quat.applyTo( quat1,[ 0.25,0.5,1.0 ] );
  // var applied2 = _.quat.applyTo( quat2,[ 0.25,0.5,1.0 ] );
  //
  // test.equivalent( applied,expected );
  // test.equivalent( applied1,expected );
  // test.equivalent( applied2,expected );
  // test.equivalent( applied1,applied2 );
  //
  // logger.log( 'm',_.quat.toMatrix( [ 0.25,0.5,0.82915619758885,0 ],null ) );
  // logger.log( 'm1',m1 );
  // logger.log( 'm1',m2 );
  // logger.log( 'quat1',quat1 );
  // logger.log( 'quat2',quat2 );
  // logger.log( 'applied',applied );
  // logger.log( 'applied1',applied1 );
  // logger.log( 'applied2',applied2 );
  // return;

  function sampleTest()
  {

    var m1 = _.euler.toMatrix( euler,null );
    var applied = m1.matrixApplyTo([ 0.25,0.5,1.0 ]);

    // var quat1 = _.quat.fromEuler( null,euler );
    var quat2 = _.quat.fromMatrixRotation( null,m1 );
    // var appliedQuat1 = _.quat.applyTo( quat1,[ 0.25,0.5,1.0 ] );
    var appliedQuat2 = _.quat.applyTo( quat2,[ 0.25,0.5,1.0 ] );

    var mq = _.quat.toMatrix( q,null );
    // var m3 = _.quat.toMatrix( quat1,null );

    test.equivalent( applied,expected );
    // test.equivalent( appliedQuat1,expected );
    test.equivalent( appliedQuat2,expected );
    // test.equivalent( appliedQuat1,appliedQuat2 );

    logger.log( 'euler',euler );
    logger.log( 'm1',m1 );
    logger.log( 'mq',mq );
    // logger.log( 'm3',m3 );
    // logger.log( 'quat1',quat1 );
    logger.log( 'quat2',quat2 );
    logger.log( 'expected',expected );
    logger.log( 'applied',applied );
    // logger.log( 'appliedQuat1',appliedQuat1 );
    logger.log( 'appliedQuat2',appliedQuat2 );

// [ -0.8749934, 0.2499915, 0.4145971;
// 0.2500373, -0.4999688, 0.8291638;
// 0.4145695, 0.8291776, 0.3749622 ]

  }

  // test.description = 'trivial zyx, not premutating'; /* */
  //
  // var q = [ 0.4,0.5,0.6,0.4795831523312719 ];
  // var euler = [ 1.7518, 0.0004, 1.7926, 2,1,0 ];
  // var expected = [ 0,0,0 ];
  //
  // sampleTest();

  test.description = 'trivial zyx, not premutating'; /* */

  var q = [ 0.25,0.5,0.82915619758885,0 ];
  var euler = [ 2.8633, -0.4275, 1.1461, 2,1,0 ];
  var expected = [ 0.32083976188534435, 0.6416910401663305, 0.893193402509267 ];

  //  -0.8750    0.2500    0.4146
  //   0.2500   -0.5000    0.8292
  //   0.4146    0.8292    0.3750

  sampleTest();

  return;
  // test.description = 'trivial xyz, not premutating'; /* */
  //
  // // var q = [ 0.25,0.5,0.82915619758885,0 ];
  // var euler = [ -1.1460588, 0.4274791, -2.863293, 0,1,2 ];
  // var expected = [ 0.32082808017730713,0.6416562497615814,0.8932226002216339 ];
  //
  // sampleTest();

  // test.description = 'trivial xzy, not premutating'; /* */
  //
  // var q = [ 0.25,0.5,0.82915619758885,0 ];
  // var euler = [ 2.1134354, 2.699121, -0.2526803, 0,2,1 ];
  // var expected = [ 0.32082808017730713,0.6416562497615814,0.8932226002216339 ];
  //
  // sampleTest();

  test.description = 'trivial yxz, not premutating'; /* */

  var euler = [ 0.25,0.5,0.82915619758885,1,0,2 ];
  var m1 = _.euler.toMatrix( euler,null );

  var expected = [ 0.2530621141195297, 0.7159013152122498, 0.8578723147511482 ];
  var applied = m1.matrixApplyTo([ 0.25,0.5,1.0 ] );

  var quat1 = _.quat.fromEuler( null,euler );
  var quat2 = _.quat.fromMatrixRotation( null,m1 );
  var applied1 = _.quat.applyTo( quat1,[ 0.25,0.5,1.0 ] );
  var applied2 = _.quat.applyTo( quat2,[ 0.25,0.5,1.0 ] );

  test.equivalent( applied,expected );
  test.equivalent( applied1,expected );
  test.equivalent( applied2,expected );
  test.equivalent( applied1,applied2 );

  // logger.log( 'm1',m1 );
  // logger.log( 'quat1',quat1 );
  // logger.log( 'quat2',quat2 );
  // logger.log( 'applied',applied );
  // logger.log( 'applied1',applied1 );
  // logger.log( 'applied2',applied2 );

  test.equivalent( applied,expected );

  test.description = 'trivial yzx, not premutating'; /* */

  var euler = [ 0.25,0.5,0.82915619758885,1,2,0 ];
  var m1 = _.euler.toMatrix( euler,null );

  var expected = [  0.10337161687032922620704260170366, 0.63904984198111440718540503189963, 0.945214054217099848725599587179 ];
  var applied = m1.matrixApplyTo([ 0.25,0.5,1.0 ] );

  var quat1 = _.quat.fromEuler( null,euler );
  var quat2 = _.quat.fromMatrixRotation( null,m1 );
  var applied1 = _.quat.applyTo( quat1,[ 0.25,0.5,1.0 ] );
  var applied2 = _.quat.applyTo( quat2,[ 0.25,0.5,1.0 ] );

  test.equivalent( applied,expected );
  test.equivalent( applied1,expected );
  test.equivalent( applied2,expected );
  test.equivalent( applied1,applied2 );

  // logger.log( 'm1',m1 );
  // logger.log( 'quat1',quat1 );
  // logger.log( 'quat2',quat2 );
  // logger.log( 'applied',applied );
  // logger.log( 'applied1',applied1 );
  // logger.log( 'applied2',applied2 );

  test.equivalent( applied,expected );

  test.description = 'trivial zxy, not premutating'; /* */

  var euler = [ 0.25,0.5,0.82915619758885,2,0,1 ];
  var m1 = _.euler.toMatrix( euler,null );

  var expected = [ 0.35110081948689522723014362674347, 0.25845504803910486458114577211113, 1.0594475931818121834782685936401 ];
  var applied = m1.matrixApplyTo([ 0.25,0.5,1.0 ] );

  var quat1 = _.quat.fromEuler( null,euler );
  var quat2 = _.quat.fromMatrixRotation( null,m1 );
  var applied1 = _.quat.applyTo( quat1,[ 0.25,0.5,1.0 ] );
  var applied2 = _.quat.applyTo( quat2,[ 0.25,0.5,1.0 ] );

  test.equivalent( applied,expected );
  test.equivalent( applied1,expected );
  test.equivalent( applied2,expected );
  test.equivalent( applied1,applied2 );

  // logger.log( 'm1',m1 );
  // logger.log( 'quat1',quat1 );
  // logger.log( 'quat2',quat2 );
  // logger.log( 'applied',applied );
  // logger.log( 'applied1',applied1 );
  // logger.log( 'applied2',applied2 );

  test.description = 'trivial zyx, not premutating'; /* */

  var euler = [ 0.25,0.5,0.82915619758885,2,1,0 ];
  var m1 = _.euler.toMatrix( euler,null );

  var expected = [ 0.30407903473460450205181031365661, 0.26504222953334272978258325424794, 1.0722819392300077603778543592048 ];
  var applied = m1.matrixApplyTo([ 0.25,0.5,1.0 ] );

  var quat1 = _.quat.fromEuler( null,euler );
  var quat2 = _.quat.fromMatrixRotation( null,m1 );
  var applied1 = _.quat.applyTo( quat1,[ 0.25,0.5,1.0 ] );
  var applied2 = _.quat.applyTo( quat2,[ 0.25,0.5,1.0 ] );

  test.equivalent( applied,expected );
  test.equivalent( applied1,expected );
  test.equivalent( applied2,expected );
  test.equivalent( applied1,applied2 );

  logger.log( 'm1',m1 );
  logger.log( 'quat1',quat1 );
  logger.log( 'quat2',quat2 );
  logger.log( 'applied',applied );
  logger.log( 'applied1',applied1 );
  logger.log( 'applied2',applied2 );

  var m2 = _.Space.make([ 3,3 ]).copy
  ([
      0.8503,    0.1754,    0.4962,
      0.2171,    0.7420,   -0.6343,
     -0.4794,    0.6471,    0.5928,
  ]);

  logger.log( 'm2',m2 );
  var applied = m2.matrixApplyTo([ 0.25,0.5,1.0 ] );
  logger.log( 'applied',applied );

// 0.8503    0.1754    0.4962
// 0.2171    0.7420   -0.6343
// -0.4794    0.6471    0.5928

  debugger;
}

// --
// define class
// --

var Self =
{

  name : 'Tools/Math/Euler',
  silencing : 1,
  enabled : 1,

  context :
  {
  },

  tests :
  {

    is : is,
    isZero : isZero,

    make : make,
    makeZero : makeZero,

    zero : zero,

    // fromAxisAndAngle : fromAxisAndAngle,
    fromQuat : fromQuat,
    fromMatrix : fromMatrix,
    toMatrix : toMatrix,

  },

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
