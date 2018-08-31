(function _Line_s_(){

'use strict';

let _ = _global_.wTools;
let avector = _.avector;
let vector = _.vector;
let Self = _.line = _.line || Object.create( null );

// --
//
// --
//


function make( dim )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  let result = _.line.makeZero( dim );
  if( _.line.is( dim ) )
  _.avector.assign( result,dim );
  return result;
}

//

function makeZero( dim )
{
  if( _.line.is( dim ) )
  dim = _.line.dimGet( dim );
  if( dim === undefined || dim === null )
  dim = 3;
  _.assert( dim >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );
  let result = _.dup( 0,dim*2 );
  return result;
}

//

function makeNil( dim )
{
  if( _.line.is( dim ) )
  dim = _.line.dimGet( dim );
  if( dim === undefined || dim === null )
  dim = 3;

  _.assert( dim >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );
  let result = [];
  for( let i = 0 ; i < dim ; i++ )
  result[ i ] = +Infinity;
  for( let i = 0 ; i < dim ; i++ )
  result[ dim+i ] = -Infinity;

  return result;
}

//

function zero( line )
{

  _.assert( arguments.length === 0 || arguments.length === 1 );

  if( _.line.is( line ) )
  {
    let lineView = _.line._from( line );
    lineView.assign( 0 );
    return line;
  }

  return _.line.makeZero( line );
}

//

function nil( line )
{

  _.assert( arguments.length === 0 || arguments.length === 1 );

  if( _.line.is( line ) )
  {
    let lineView = _.line._from( line );
    let min = _.line.originGet( lineView );
    let max = _.line.directionGet( lineView );

    _.vector.assign( min, +Infinity );
    _.vector.assign( max, -Infinity );

    return line;
  }

  return _.line.makeNil( line );
}

//

function from( line )
{

  _.assert( _.line.is( line ) || line === null );
  _.assert( arguments.length === 1, 'expects single argument' );

  if( line === null )
  return _.line.make();

  return line;
}

//

function _from( line )
{
  _.assert( _.line.is( line ) );
  _.assert( arguments.length === 1, 'expects single argument' );
  return _.vector.from( line );
}

//

/**
  * Get a line out of two points. Returns a vector with the coordinates of the line.
  * The pair of points stays untouched.
  *
  * @param { Array } pair - The source points.
  *
  * @example
  * // returns  [ 1, 2, 1, 2 ]
  * _.fromPair( [ 1, 2 ], [ 3, 4 ] );
  *
  * @returns { Vector } Returns the line containing the two points.
  * @function fromPair
  * @throws { Error } An Error if ( arguments.length ) is different than one.
  * @throws { Error } An Error if ( pair ) is not array.
  * @memberof wTools.line
  */
function fromPair( pair )
{
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( pair.length === 2, 'expects two points' );
  _.assert( pair[ 0 ].length === pair[ 1 ].length, 'expects two points' );

  let result = _.array.makeArrayOfLength( pair[ 0 ].length * 2 );

  for( let i = 0; i < pair[ 0 ].length ; i++ )
  {
    result[ i ] = pair[ 0 ][ i ];
    result[ pair[ 0 ].length + i ] = avector.sub( null, pair[ 1 ], pair[ 0 ] )[ i ];
  }

  debugger;
  return result;
}

fromPair.shaderChunk =
`
  void line_fromPair( out vec2 dstLine[ 2 ], vec2 pair[ 2 ] )
  {
    dstLine[ 0 ] = pair[ 0 ];
    dstLine[ 1 ] = pair[ 1 ] - pair[ 0 ];
  }

  void line_fromPair( out vec3 dstLine[ 2 ], vec3 pair[ 2 ] )
  {
    dstLine[ 0 ] = pair[ 0 ];
    dstLine[ 1 ] = pair[ 1 ] - pair[ 0 ];
  }
`

//

/**
  * Check if input is a line. Returns true if it is a line and false if not.
  *
  * @param { Vector } line - Source line.
  *
  * @example
  * // returns true;
  * _.is( [ 0, 0, 1, 1 ] );
  *
  * @returns { Boolean } Returns true if the input is line.
  * @function is
  * @throws { Error } An Error if ( arguments.length ) is different than one.
  * @memberof wTools.line
  */
function is( line )
{
  _.assert( arguments.length === 1, 'expects single argument' );
  return ( _.longIs( line ) || _.vectorIs( line ) ) && ( line.length >= 0 ) && ( line.length % 2 === 0 );
}

//

/**
  * Get line dimension. Returns the dimension of the line. Line stays untouched.
  *
  * @param { Vector } line - The source line.
  *
  * @example
  * // returns 2
  * _.dimGet( [ 0, 0, 2, 2 ] );
  *
  * @example
  * // returns 1
  * _.dimGet( [ 0, 1 ] );
  *
  * @returns { Number } Returns the dimension of the line.
  * @function dimGet
  * @throws { Error } An Error if ( arguments.length ) is different than one.
  * @throws { Error } An Error if ( line ) is not line.
  * @memberof wTools.line
  */
function dimGet( line )
{
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( _.line.is( line ) );
  return line.length / 2;
}

//

/**
  * Get the origin of a line. Returns a vector with the coordinates of the origin of the line.
  * Line stays untouched.
  *
  * @param { Vector } line - The source line.
  *
  * @example
  * // returns   0, 0
  * _.originGet( [ 0, 0, 2, 2 ] );
  *
  * @example
  * // returns  1
  * _.originGet( [ 1, 2 ] );
  *
  * @returns { Vector } Returns the coordinates of the origin of the line.
  * @function originGet
  * @throws { Error } An Error if ( arguments.length ) is different than one.
  * @throws { Error } An Error if ( line ) is not line.
  * @memberof wTools.line
  */
function originGet( line )
{
  _.assert( arguments.length === 1, 'expects single argument' );
  let lineView = _.line._from( line );
  return lineView.subarray( 0, line.length/ 2 );
}

//

/**
  * Get the direction of a line. Returns a vector with the coordinates of the direction of the line.
  * Line stays untouched.
  *
  * @param { Vector } line - The source line.
  *
  * @example
  * // returns   2, 2
  * _.directionGet( [ 0, 0, 2, 2 ] );
  *
  * @example
  * // returns  2
  * _.directionGet( [ 1, 2 ] );
  *
  * @returns { Vector } Returns the direction of the line.
  * @function directionGet
  * @throws { Error } An Error if ( arguments.length ) is different than one.
  * @throws { Error } An Error if ( line ) is not line.
  * @memberof wTools.line
  */
function directionGet( line )
{
  _.assert( arguments.length === 1, 'expects single argument' );
  let lineView = _.line._from( line );
  return lineView.subarray( line.length/ 2, line.length );
}

//

/**
  * Get a point in a line. Returns a vector with the coordinates of the point of the line.
  * Line and factor stay untouched.
  *
  * @param { Vector } srcLine - The source line.
  * @param { Vector } factor - The source factor.
  *
  * @example
  * // returns   4, 4
  * _.lineAt( [ 0, 0, 2, 2 ], 2 );
  *
  * @example
  * // returns  1
  * _.lineAt( [ 1, 2 ], 0 );
  *
  * @returns { Vector } Returns a point in the line at a given factor.
  * @function lineAt
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( factor ) is not number.
  * @memberof wTools.line
  */
function lineAt( srcLine, factor )
{

  _.assert( arguments.length === 2, 'expects single argument' );
  _.assert( _.line.is( srcLine ) );
  _.assert( _.numberIs( factor ) );

  let lineView = _.line._from( srcLine )
  let origin = _.line.originGet( lineView );
  let direction = _.line.directionGet( lineView );

  let result = avector.mul( null, direction, factor );
  result = avector.add( result, origin );

  return result;
}

lineAt.shaderChunk =
`
  vec2 lineAt( vec2 srcLine[ 2 ], float factor )
  {

    vec2 result = srcLine[ 1 ]*factor;
    result += srcLine[ 0 ];

    return result;
  }
`

//

/**
* Get the factor of a point inside a line. Returs the calculated factor. Point and line stay untouched.
*
* @param { Array } srcLine - The source line.
* @param { Array } srcPoint - The source point.
*
* @example
* // returns 0.5
* _.getFactor( [ 0, 0, 2, 2 ], [ 1, 1 ] );
*
* @example
* // returns false
* _.getFactor( [ 0, 0, 2, 2 ], [ - 1, 3 ] );
*
* @returns { Number } Returns the factor if the point is inside the line, and false if the point is outside it.
* @function getFactor
* @throws { Error } An Error if ( dim ) is different than point.length (line and point have not the same dimension).
* @throws { Error } An Error if ( arguments.length ) is different than two.
* @throws { Error } An Error if ( srcLine ) is not line.
* @throws { Error } An Error if ( srcPoint ) is not point.
* @memberof wTools.line
*/
function getFactor( srcLine, srcPoint )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );

  if( srcLine === null )
  srcLine = _.line.make( srcPoint.length );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimension  = _.line.dimGet( srcLineView )
  let srcPointView = _.vector.from( srcPoint.slice() );

  _.assert( dimension === srcPoint.length, 'The line and the point must have the same dimension' );
  let dOrigin = _.vector.from( avector.subVectors( srcPointView, origin ) );

  let factor;
  if( direction.eGet( 0 ) === 0 )
  {
    if( Math.abs( dOrigin.eGet( 0 ) ) > _.accuracySqr )
    {
      return false;
    }
    else
    {
      factor = 0;
    }
  }
  else
  {
    factor = dOrigin.eGet( 0 ) / direction.eGet( 0 );
  }

  for( var i = 1; i < dOrigin.length; i++ )
  {
    let newFactor;
    if( direction.eGet( i ) === 0 )
    {
      if( Math.abs( dOrigin.eGet( i ) ) > _.accuracySqr )
      {
        return false;
      }
      else
      {
        newFactor = 0;
      }
    }
    else
    {
      newFactor = dOrigin.eGet( i ) / direction.eGet( i );
      if( Math.abs( newFactor - factor ) > _.accuracySqr && newFactor !== 0 && factor !== 0 )
      {
        return false;
      }
      factor = newFactor;
    }
  }

  return factor;
}

//

/**
  * Check if two lines are parallel. Returns true if they are parallel and false if not.
  * Lines and accuracySqr stay untouched. Only for 3D.
  *
  * @param { Vector } src1Line - The first source line.
  * @param { Vector } src2Line - The second source line.
  * @param { Vector } accuracySqr - The accuracy.
  *
  * @example
  * // returns   true
  * _.lineParallel( [ 0, 0, 0, 2, 2, 2 ], [ 1, 2, 1, 4, 4, 4 ] );
  *
  * @example
  * // returns  false
  * _.lineParallel( [ 1, 2, 1, 1, 1, 2 ], [ 1, 2, 1, 1, 3, 3 ] );
  *
  * @returns { Boolean } Returns true if the lines are parallel.
  * @function lineParallel
  * @throws { Error } An Error if ( arguments.length ) is different than two or three.
  * @throws { Error } An Error if ( src1Line ) is not line.
  * @throws { Error } An Error if ( src2Line ) is not line.
  * @throws { Error } An Error if ( accuracySqr ) is not number.
  * @memberof wTools.line
  */
function lineParallel3D( src1Line, src2Line, accuracySqr )
{
  // _.assert( src1Line.length === 3 );
  // _.assert( src2Line.length === 3 );
  // _.assert( arguments.length === 2 || arguments.length === 3 );

  // if( accuracySqr === undefined )
  // accuracySqr = Self.accuracySqr;

  // return _magSqr( avector.cross( src1Line[ 1 ], src2Line[ 1 ] ) ) <= Self.accuracySqr;

  _.assert( _.line.is( src1Line ) );
  _.assert( _.line.is( src2Line ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 || accuracySqr === undefined || accuracySqr === null )
  accuracySqr = _.accuracySqr;;

  let direction1 = _.line.directionGet( src1Line );
  let direction2 = _.line.directionGet( src2Line );

  debugger;
  return avector.magSqr( avector.cross( null, direction1, direction2 )) <= accuracySqr;

}

//

function lineParallel( src1Line, src2Line, accuracySqr )
{
  // _.assert( src1Line.length === 3 );
  // _.assert( src2Line.length === 3 );
  // _.assert( arguments.length === 2 || arguments.length === 3 );

  // if( accuracySqr === undefined )
  // accuracySqr = Self.accuracySqr;

  // return _magSqr( avector.cross( src1Line[ 1 ], src2Line[ 1 ] ) ) <= Self.accuracySqr;

  _.assert( _.line.is( src1Line ) );
  _.assert( _.line.is( src2Line ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( src1Line.length === src2Line.length );

  if( arguments.length === 2 || accuracySqr === undefined || accuracySqr === null )
  accuracySqr = _.accuracySqr;;

  let direction1 = _.line.directionGet( src1Line );
  let direction2 = _.line.directionGet( src2Line );
  let proportion = undefined;

  let zeros1 = 0;                               // Check if Line1 is a point
  for( let i = 0; i < direction1.length ; i++  )
  {
    if( direction1.eGet( i ) === 0 )
    {
      zeros1 = zeros1 + 1;
    }
    if( zeros1 === direction1.length )
    return true;
  }

  let zeros2 = 0;                               // Check if Line2 is a point
  for( let i = 0; i < direction2.length ; i++  )
  {
    if( direction2.eGet( i ) === 0 )
    {
      zeros2 = zeros2 + 1;
    }
    if( zeros2 === direction2.length )
    return true;
  }

  debugger;

  for( let i = 0; i < direction1.length ; i++  )
  {
    if( direction1.eGet( i ) === 0 || direction2.eGet( i ) === 0 )
    {
      if( direction1.eGet( i ) !== direction2.eGet( i ) )
      {
        return false;
      }
    }
    else
    {
      let newProportion = direction1.eGet( i ) / direction2.eGet( i );

      if( proportion !== undefined )
      {
        if( Math.abs( proportion - newProportion ) > accuracySqr)
        return false
      }

      proportion = newProportion;
    }
  }

  return true;
}

//

/**
  * Returns the factors for the intersection of two lines. Returns a vector with the intersection factors, 0 if there is no intersection.
  * Lines stay untouched.
  *
  * @param { Vector } src1Line - The first source line.
  * @param { Vector } src2Line - The second source line.
  *
  * @example
  * // returns   0
  * _.lineIntersectionFactors( [ 0, 0, 2, 2 ], [ 1, 1, 4, 4 ] );
  *
  * @example
  * // returns  _.vector.from( [ 2, 1 ] )
  * _.lineIntersectionFactors( [ - 2, 0, 1, 0 ], [ 0, - 2, 0, 2 ] );
  *
  * @returns { Array } Returns the factors for the two lines intersection.
  * @function lineIntersectionFactors
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( src1Line ) is not line.
  * @throws { Error } An Error if ( src2Line ) is not line.
  * @memberof wTools.line
  */
function lineIntersectionFactors( srcLine1, srcLine2 )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );
  _.assert( srcLine1.length === srcLine2.length,'The two lines must have the same dimension' );

  let srcLine1View = _.line._from( srcLine1.slice() );
  let srcLine2View = _.line._from( srcLine2.slice() );

  let origin1 = _.line.originGet( srcLine1View );
  let origin2 = _.line.originGet( srcLine2View );

  let dOrigin = _.vector.from( avector.subVectors( origin2.clone(), origin1 ) );

  let direction1 = _.line.directionGet( srcLine1View );
  let direction2 = _.line.directionGet( srcLine2View );
  let directions = _.Space.make( [ srcLine1.length / 2 , 2 ] );
  directions.colVectorGet( 0 ).copy( direction1 );
  directions.colVectorGet( 1 ).copy( direction2.clone().mulScalar( - 1 ) );

  // Same origin
  let identOrigin = 0;
  for( let i = 0; i < origin1.length; i++ )
  {
    if( origin1.eGet( i ) === origin2.eGet( i ) )
    identOrigin = identOrigin + 1;
  }

  if( identOrigin === origin1.length )
  return _.vector.from( [ 0, 0 ] );

  // Parallel lines
  if( lineParallel( srcLine1, srcLine2 ) === true )
  return 0;

  let result = _.vector.from( [ 0, 0 ] );

  debugger;

  let j = 0;
  for( let i = 0; i < dOrigin.length - 1 ; i++ )
  {
    let m = _.Space.make( [ 2, 2 ] );
    m.rowSet( 0, directions.rowVectorGet( i ) );
    m.rowSet( 1, directions.rowVectorGet( i + 1 ) );

    if( m.determinant() === 0 )
    {}
    else
    {
      let or = _.Space.makeCol( [ dOrigin.eGet( i ), dOrigin.eGet( i + 1 ) ] );
      let o =
      {
        x : null,
        m : m,
        y : or,
        kernel : null,
        pivoting : 1,
      }

      let x = _.Space.solveGeneral( o );
      if( j === 0 )
      {
        result = _.vector.from( x.base )
      }
      else
      {
        let x1 = x.base.colVectorGet( 0 ).eGet( 0 );
        let x2 = x.base.colVectorGet( 0 ).eGet( 1 );

        let samex1 = Math.abs( x1 - result.eGet( 0 ) ) < 1E-6 || Math.abs( x1 - result.eGet( 1 ) ) < 1E-6 ;
        let samex2 = Math.abs( x2 - result.eGet( 0 ) ) < 1E-6 || Math.abs( x2 - result.eGet( 1 ) ) < 1E-6 ;

        if( x1 !== 0 )
        {
          if( samex1 )
          {
            result.eSet( 0, _.vector.from( x.base ).eGet( 0 ) );
          }
          else if ( ( result.eGet( 0 ) === 0 || result.eGet( 1 ) === 0 ) && samex2 )
          {
            result.eSet( 0, _.vector.from( x.base ).eGet( 0 ) );
          }
          else
          {
            return 0;
          }
        }
        if( x2 !== 0 )
        {
          if( samex2 )
          {
            result.eSet( 1, _.vector.from( x.base ).eGet( 1 ) );
          }
          else if ( ( result.eGet( 0 ) === 0 || result.eGet( 1 ) === 0 ) && samex1 )
          {
            result.eSet( 1, _.vector.from( x.base ).eGet( 1 ) );
          }
          else
          {
            return 0;
          }
        }
      }
      j = j + 1;
    }
    var oldDeterminant = m.determinant();
  }

  if( result.eGet( 0 ) === 0 && result.eGet( 1 ) === 0 )
  {
    return 0;
  }

  // Check result
  let point1 = _.vector.from( _.array.makeArrayOfLength( origin1.length ) )
  let point2 = _.vector.from( _.array.makeArrayOfLength( origin1.length ) )
  for( let i = 0; i < origin1.length; i++ )
  {
    point1.eSet( i, origin1.eGet( i ) + result.eGet( 0 )*direction1.eGet( i ) )
    point2.eSet( i, origin2.eGet( i ) + result.eGet( 1 )*direction2.eGet( i ) )

    if( Math.abs( point1.eGet( i ) - point2.eGet( i ) ) > _.accuracy )
    {
      return 0
    }
  }
  return result;
}

//

/**
  * Returns the points of the intersection of two lines. Returns an array with the intersection points, 0 if there is no intersection.
  * Lines stay untouched.
  *
  * @param { Vector } src1Line - The first source line.
  * @param { Vector } src2Line - The second source line.
  *
  * @example
  * // returns   0
  * _.lineIntersectionPoints( [ 0, 0, 2, 2 ], [ 1, 1, 4, 4 ] );
  *
  * @example
  * // returns  [ [ 0, 0 ], [ 0, 0 ] ]
  * _.lineIntersectionPoints( [ -3, 0, 1, 0 ], [ 0, -2, 0, 1 ] );
  *
  * @returns { Array } Returns the points of intersection of the two lines.
  * @function lineIntersectionPoints
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( src1Line ) is not line.
  * @throws { Error } An Error if ( src2Line ) is not line.
  * @memberof wTools.line
  */
function lineIntersectionPoints( srcLine1,srcLine2 )
{
  let factors = lineIntersectionFactors( srcLine1,srcLine2 );
  if( factors === 0 )
  return 0;

  let factorsView = _.vector.from( factors );
  let result = [ Self.lineAt( srcLine1, factorsView.eGet( 0 ) ), Self.lineAt( srcLine2, factorsView.eGet( 1 ) ) ];
  return result;
}

lineIntersectionPoints.shaderChunk =
`
  void lineIntersectionPoints( out vec2 result[ 2 ], vec2 srcLine1[ 2 ], vec2 srcLine2[ 2 ] )
  {

    vec2 factors = lineIntersectionFactors( srcLine1,srcLine2 );
    result[ 0 ] = lineAt( srcLine1,factors[ 0 ] );
    result[ 1 ] = lineAt( srcLine2,factors[ 1 ] );

  }
`

//

/**
  * Returns the point of the intersection of two lines. Returns an array with the intersection point, 0 if there is no intersection.
  * Lines stay untouched.
  *
  * @param { Vector } src1Line - The first source line.
  * @param { Vector } src2Line - The second source line.
  *
  * @example
  * // returns   0
  * _.lineIntersectionPoint( [ 0, 0, 2, 2 ], [ 1, 1, 4, 4 ] );
  *
  * @example
  * // returns  [ [ 0, 0 ], [ 0, 0 ] ]
  * _.lineIntersectionPoint( [ -3, 0, 1, 0 ], [ 0, -2, 0, 1 ] );
  *
  * @returns { Array } Returns the point of intersection of the two lines.
  * @function lineIntersectionPoint
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( src1Line ) is not line.
  * @throws { Error } An Error if ( src2Line ) is not line.
  * @memberof wTools.line
  */
function lineIntersectionPoint( srcLine1,srcLine2 )
{

  let factors = Self.lineIntersectionFactors( srcLine1,srcLine2 );

  if( factors === 0 )
  return 0;

  return Self.lineAt( srcLine1,factors.eGet( 0 ) );

}

lineIntersectionPoint.shaderChunk =
`
  vec2 lineIntersectionPoint( vec2 srcLine1[ 2 ], vec2 srcLine2[ 2 ] )
  {

    vec2 factors = lineIntersectionFactors( srcLine1,srcLine2 );
    return lineAt( srcLine1,factors[ 0 ] );

  }
`

//

/**
  * Returns the point of the intersection of two lines. Returns an array with the intersection point, 0 if there is no intersection.
  * Lines stay untouched.
  *
  * @param { Vector } src1Line - The first source line.
  * @param { Vector } src2Line - The second source line.
  *
  * @example
  * // returns   0
  * _.lineIntersectionPointAccurate( [ 0, 0, 2, 2 ], [ 1, 1, 4, 4 ] );
  *
  * @example
  * // returns  [ [ 0, 0 ], [ 0, 0 ] ]
  * _.lineIntersectionPointAccurate( [ -3, 0, 1, 0 ], [ 0, -2, 0, 1 ] );
  *
  * @returns { Array } Returns the point of intersection of the two lines.
  * @function lineIntersectionPointAccurate
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( src1Line ) is not line.
  * @throws { Error } An Error if ( src2Line ) is not line.
  * @memberof wTools.line
  */
function lineIntersectionPointAccurate( srcLine1,srcLine2 )
{

  let closestPoints = Self.lineIntersectionPoints( srcLine1,srcLine2 );
  debugger;

  if( closestPoints === 0)
  return 0;

  return _.avector.mulScalar( _.avector.add( null, closestPoints[ 0 ], closestPoints[ 1 ] ), 0.5 );

}

lineIntersectionPointAccurate.shaderChunk =
`
  vec2 lineIntersectionPointAccurate( vec2 srcLine1[ 2 ], vec2 srcLine2[ 2 ] )
  {

    vec2 closestPoints[ 2 ];
    lineIntersectionPoints( closestPoints,srcLine1,srcLine2 );
    return ( closestPoints[ 0 ] + closestPoints[ 1 ] ) * 0.5;

  }
`

//

/**
  * Check if two lines intersect. Returns true if they intersect, false if not.
  * Lines stay untouched.
  *
  * @param { Vector } src1Line - The first source line.
  * @param { Vector } src2Line - The second source line.
  *
  * @example
  * // returns   true
  * _.lineIntersects( [ 0, 0, 2, 2 ], [ 1, 1, 4, 4 ] );
  *
  * @example
  * // returns  false
  * _.lineIntersects( [ -3, 0, 1, 0 ], [ 0, -2, 1, 0 ] );
  *
  * @returns { Boolean } Returns true if the two lines intersect.
  * @function lineIntersects
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( src1Line ) is not line.
  * @throws { Error } An Error if ( src2Line ) is not line.
  * @memberof wTools.line
  */
function lineIntersects( srcLine1, srcLine2 )
{

  if( _.line.lineIntersectionFactors( srcLine1, srcLine2 ) === 0 )
  return false

  return true;
}

//

/**
  * Get the distance between two lines. Returns the calculated distance.
  * The lines remain unchanged.
  *
  * @param { Array } srcLine - Source line.
  * @param { Array } tstLine - Test line.
  *
  * @example
  * // returns 0;
  * _.lineDistance( [ 0, 0, 0, 2, 2, 2 ], [ 0, 0, 0, 1, 1, 1 ]);
  *
  * @example
  * // returns Math.sqrt( 12 );
  * _.lineDistance( [ 0, 0, 0, 0, -2, 0 ] , [ 2, 2, 2, 0, 0, 1 ]);
  *
  * @returns { Number } Returns the distance between two lines.
  * @function lineDistance
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( tstLine ) is not line.
  * @throws { Error } An Error if ( dim ) is different than line.dimGet (the lines don´t have the same dimension).
  * @memberof wTools.line
  */
function lineDistance( srcLine, tstLine )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );

  if( srcLine === null )
  srcLine = _.line.make( tstLine.length / 2 );

  let srcLineView = _.line._from( srcLine );
  let srcOrigin = _.line.originGet( srcLineView );
  let srcDirection = _.line.directionGet( srcLineView );
  let srcDim  = _.line.dimGet( srcLineView )

  let tstLineView = _.line._from( tstLine );
  let tstOrigin = _.line.originGet( tstLineView );
  let tstDirection = _.line.directionGet( tstLineView );
  let tstDim  = _.line.dimGet( tstLineView );

  _.assert( srcDim === tstDim );

  let distance;

  if( _.line.lineIntersects( srcLineView, tstLineView ) === true )
  return 0;
  // Parallel lines
  if( _.line.lineParallel( srcLineView, tstLineView ) )
  {
    let d1 = _.line.pointDistance( srcLineView, tstOrigin );
    let d2 = _.line.pointDistance( tstLineView, srcOrigin );
    let d3 = _.avector.distance( srcOrigin, tstOrigin );

    if( d1 <= d2 && d1 <= d3 )
    {
      distance = d1;
    }
    else if( d2 <= d3 )
    {
      distance = d2;
    }
    else
    {
      distance = d3;
    }
  }
  else
  {
    let srcPoint = _.line.lineClosestPoint( srcLineView, tstLineView );
    let tstPoint = _.line.lineClosestPoint( tstLineView, srcLineView );
    distance = _.avector.distance( srcPoint, tstPoint );
  }


  return distance;
}

//

/**
  * Get the closest point in a line to a line. Returns the calculated point.
  * The lines remain unchanged.
  *
  * @param { Array } srcLine - Source line.
  * @param { Array } tstLine - Test line.
  *
  * @example
  * // returns 0;
  * _.lineClosestPoint( [ 0, 0, 0, 2, 2, 2 ] , [ 0, 0, 0, 1, 1, 1 ]);
  *
  * @example
  * // returns [ 0, 0, 0 ];
  * _.lineClosestPoint( [ 0, 0, 0, 0, 1, 0 ] , [ 1, 0, 0, 1, 0, 0 ]);
  *
  * @returns { Array } Returns the closest point in the srcLine to the tstLine.
  * @function lineClosestPoint
  * @throws { Error } An Error if ( arguments.length ) is different than two or three.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( tstLine ) is not line.
  * @throws { Error } An Error if ( dim ) is different than line.dimGet (the lines don´t have the same dimension).
  * @memberof wTools.line
  */
function lineClosestPoint( srcLine, tstLine, dstPoint )
{
  _.assert( arguments.length === 2 || arguments.length === 3 , 'expects two or three arguments' );

  if( arguments.length === 2 )
  dstPoint = _.array.makeArrayOfLength( tstLine.length / 2 );

  if( dstPoint === null || dstPoint === undefined )
  throw _.err( 'Not a valid destination point' );

  if( srcLine === null )
  srcLine = _.line.make( tstLine.length / 2 );

  let srcLineView = _.line._from( srcLine );
  let srcOrigin = _.line.originGet( srcLineView );
  let srcDir = _.line.directionGet( srcLineView );
  let srcDim  = _.line.dimGet( srcLineView );

  let tstLineView = _.line._from( tstLine );
  let tstOrigin = _.line.originGet( tstLineView );
  let tstDir = _.line.directionGet( tstLineView );
  let tstDim = _.line.dimGet( tstLineView );

  let dstPointView = _.vector.from( dstPoint );
  _.assert( srcDim === tstDim );

  let pointView;

  // Same origin
  let identOrigin = 0;
  for( let i = 0; i < srcOrigin.length; i++ )
  {
    if( srcOrigin.eGet( i ) === tstOrigin.eGet( i ) )
    identOrigin = identOrigin + 1;
  }
  if( identOrigin === srcOrigin.length )
  pointView = srcOrigin;
  else
  {
    // Parallel lines
    if( _.line.lineParallel( srcLineView, tstLineView ) )
    {
      pointView = _.line.pointClosestPoint( srcLineView, tstOrigin );
    }
    else
    {
      let srcMod = _.vector.dot( srcDir, srcDir );
      let tstMod = _.vector.dot( tstDir, tstDir );
      let mod = _.vector.dot( srcDir, tstDir );
      let dOrigin = _.vector.from( avector.subVectors( tstOrigin.slice(), srcOrigin ) );
      let factor = ( - mod*_.vector.dot( tstDir, dOrigin ) + tstMod*_.vector.dot( srcDir, dOrigin ))/( tstMod*srcMod - mod*mod );

      pointView = _.line.lineAt( srcLineView, factor );
    }
  }

  pointView = _.vector.from( pointView );
  for( let i = 0; i < pointView.length; i++ )
  {
    dstPointView.eSet( i, pointView.eGet( i ) );
  }

  return dstPoint;
}

//

/**
  * Check if a given point is contained inside a line. Returs true if it is contained, false if not.
  * Point and line stay untouched.
  *
  * @param { Array } srcLine - The source line.
  * @param { Array } srcPoint - The source point.
  *
  * @example
  * // returns true
  * _.pointContains( [ 0, 0, 2, 2 ], [ 1, 1 ] );
  *
  * @example
  * // returns false
  * _.pointContains( [ 0, 0, 2, 2 ], [ - 1, 3 ] );
  *
  * @returns { Boolen } Returns true if the point is inside the line, and false if the point is outside it.
  * @function pointContains
  * @throws { Error } An Error if ( dim ) is different than point.length (line and point have not the same dimension).
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( srcPoint ) is not point.
  * @memberof wTools.line
  */
function pointContains( srcLine, srcPoint )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );

  if( srcLine === null )
  srcLine = _.line.make( srcPoint.length );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimension  = _.line.dimGet( srcLineView )
  let srcPointView = _.vector.from( srcPoint.slice() );

  _.assert( dimension === srcPoint.length, 'The line and the point must have the same dimension' );
  let dOrigin = _.vector.from( avector.subVectors( srcPointView, origin ) );

  let factor;
  if( direction.eGet( 0 ) === 0 )
  {
    if( Math.abs( dOrigin.eGet( 0 ) ) > _.accuracySqr )
    {
      return false;
    }
    else
    {
      factor = 0;
    }
  }
  else
  {
    factor = dOrigin.eGet( 0 ) / direction.eGet( 0 );
  }
  for( var i = 1; i < dOrigin.length; i++ )
  {
    let newFactor;
    if( direction.eGet( i ) === 0 )
    {
      if( Math.abs( dOrigin.eGet( i ) ) > _.accuracySqr )
      {
        return false;
      }
      else
      {
        newFactor = 0;
      }
    }
    else
    {
      newFactor = dOrigin.eGet( i ) / direction.eGet( i );

      if( Math.abs( newFactor - factor ) > _.accuracySqr && factor !== 0 )
      {
        return false;
      }
      factor = newFactor;
    }
  }

  return true;
}

//

/**
  * Get the distance between a point and a line. Returs the calculated distance. Point and line stay untouched.
  *
  * @param { Array } srcLine - The source line.
  * @param { Array } srcPoint - The source point.
  *
  * @example
  * // returns 0
  * _.pointDistance( [ 0, 0, 0, 2 ], [ 0, 1 ] );
  *
  * @example
  * // returns 2
  * _.pointDistance( [ 0, 0, 0, 2 ], [ 2, 2 ] );
  *
  * @returns { Boolen } Returns the distance between the point and the line.
  * @function pointDistance
  * @throws { Error } An Error if ( dim ) is different than point.length (line and point have not the same dimension).
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( srcPoint ) is not point.
  * @memberof wTools.line
  */
function pointDistance( srcLine, srcPoint )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );

  if( srcLine === null )
  srcLine = _.line.make( srcPoint.length );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimension  = _.line.dimGet( srcLineView )
  let srcPointView = _.vector.from( srcPoint.slice() );

  _.assert( dimension === srcPoint.length, 'The line and the point must have the same dimension' );

  if( _.line.pointContains( srcLineView, srcPointView ) )
  {
    return 0;
  }
  else
  {
    let projection = _.line.pointClosestPoint( srcLineView, srcPointView );
    let factor = _.line.getFactor( srcLineView, projection );

    if( factor === false )
    {
      let dOrigin = _.vector.from( avector.subVectors( srcPointView, origin ) );
      return Math.norm( dOrigin );
    }
    else
    {
      let dPoints = _.vector.from( avector.subVectors( srcPointView, projection ) );
      debugger;
      let mod = _.vector.dot( dPoints, dPoints );
      mod = Math.sqrt( mod );

      return mod;
    }

  }

  return true;
}

/**
  * Get the closest point between a point and a line. Returs the calculated point. srcPoint and line stay untouched.
  *
  * @param { Array } srcLine - The source line.
  * @param { Array } srcPoint - The source point.
  * @param { Array } dstPoint - The destination point.
  *
  * @example
  * // returns 0
  * _.pointClosestPoint( [ 0, 0, 0, 2 ], [ 0, 1 ] );
  *
  * @example
  * // returns [ 0, 2 ]
  * _.pointClosestPoint( [ 0, 0, 0, 2 ], [ 2, 2 ] );
  *
  * @returns { Boolen } Returns the closest point in a line to a point.
  * @function pointClosestPoint
  * @throws { Error } An Error if ( dim ) is different than point.length (line and point have not the same dimension).
  * @throws { Error } An Error if ( arguments.length ) is different than two or three.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( srcPoint ) is not point.
  * @memberof wTools.line
  */
function pointClosestPoint( srcLine, srcPoint, dstPoint )
{
  _.assert( arguments.length === 2 || arguments.length === 3 , 'expects two or three arguments' );

  if( arguments.length === 2 )
  dstPoint = _.array.makeArrayOfLength( srcPoint.length );

  if( dstPoint === null || dstPoint === undefined )
  throw _.err( 'Not a valid destination point' );

  if( srcLine === null )
  srcLine = _.line.make( srcPoint.length );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimension  = _.line.dimGet( srcLineView )
  let srcPointView = _.vector.from( srcPoint.slice() );
  let dstPointView = _.vector.from( dstPoint );

  _.assert( dimension === srcPoint.length, 'The line and the point must have the same dimension' );

  let pointVector;

  var dir = 0;
  for( var i = 0; i < direction.length; i++ )
  {
    if( direction.eGet( i ) === 0 )
    dir = dir + 1;
  }

  if( dir === direction.length )
  {
    pointVector = origin;
  }
  else if( _.line.pointContains( srcLineView, srcPointView ) )
  {
    pointVector = _.vector.from( srcPointView );
  }
  else
  {
    let dOrigin = _.vector.from( avector.subVectors( srcPointView, origin ) );
    let dot = _.vector.dot( direction, direction );
    let factor = _.vector.dot( direction , dOrigin ) / dot ;
    if( dot === 0 )
    {
      pointVector = _.vector.from( origin );
    }
    else
    {
      pointVector = _.vector.from( _.line.lineAt( srcLineView, factor ) );
    }
  }

  for( let i = 0; i < pointVector.length; i++ )
  {
    dstPointView.eSet( i, pointVector.eGet( i ) );
  }

  return dstPoint;
}

//

/**
  * Check if a line and a box intersect. Returns true if they intersect and false if not.
  * The box and the line remain unchanged. Only for 1D to 3D
  *
  * @param { Array } srcLine - Source line.
  * @param { Array } srcBox - Source box.
  *
  * @example
  * // returns true;
  * _.boxIntersects( [ 0, 0, 0, 2, 2, 2 ] , [ 0, 0, 0, 1, 1, 1 ]);
  *
  * @example
  * // returns false;
  * _.boxIntersects( [ 0, -1, 0, 0, -2, 0 ] , [ 2, 2, 2, 2, 2, 2 ]);
  *
  * @returns { Boolean } Returns true if the line and the box intersect.
  * @function boxIntersects
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( srcBox ) is not box.
  * @throws { Error } An Error if ( dim ) is different than box.dimGet (the line and box don´t have the same dimension).
  * @memberof wTools.line
  */
function boxIntersects( srcLine, srcBox )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );

  if( srcLine === null )
  srcLine = _.line.make( srcBox.length / 2 );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimLine  = _.line.dimGet( srcLineView )

  let boxView = _.box._from( srcBox );
  let dimBox = _.box.dimGet( boxView );
  let min = _.vector.from( _.box.cornerLeftGet( boxView ) );
  let max = _.vector.from( _.box.cornerRightGet( boxView ) );

  _.assert( dimLine === dimBox );

  if( _.box.pointContains( boxView, origin ) )
  return true;

  /* box corners */
  let c = _.box.cornersGet( boxView );

  for( let j = 0 ; j < _.Space.dimsOf( c )[ 1 ] ; j++ )
  {
    let corner = c.colVectorGet( j );
    let projection = _.line.pointClosestPoint( srcLineView, corner );

    if( _.box.pointContains( boxView, projection ) )
    return true;
  }

  return false;

}

//

/**
  * Get the distance between a line and a box. Returns the calculated distance.
  * The box and the line remain unchanged. Only for 1D to 3D
  *
  * @param { Array } srcLine - Source line.
  * @param { Array } srcBox - Source box.
  *
  * @example
  * // returns 0;
  * _.boxDistance( [ 0, 0, 0, 2, 2, 2 ] , [ 0, 0, 0, 1, 1, 1 ]);
  *
  * @example
  * // returns Math.sqrt( 12 );
  * _.boxDistance( [ 0, 0, 0, 0, -2, 0 ] , [ 2, 2, 2, 2, 2, 2 ]);
  *
  * @returns { Number } Returns the distance between the line and the box.
  * @function boxDistance
  * @throws { Error } An Error if ( arguments.length ) is different than two.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( srcBox ) is not box.
  * @throws { Error } An Error if ( dim ) is different than box.dimGet (the line and box don´t have the same dimension).
  * @memberof wTools.line
  */
function boxDistance( srcLine, srcBox )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );

  if( srcLine === null )
  srcLine = _.line.make( srcBox.length / 2 );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimLine  = _.line.dimGet( srcLineView )

  let boxView = _.box._from( srcBox );
  let dimBox = _.box.dimGet( boxView );
  let min = _.vector.from( _.box.cornerLeftGet( boxView ) );
  let max = _.vector.from( _.box.cornerRightGet( boxView ) );

  _.assert( dimLine === dimBox );

  if( _.line.boxIntersects( srcLineView, boxView ) )
  return 0;

  let closestPoint = _.line.boxClosestPoint( srcLineView, boxView );
  return _.box.pointDistance( boxView, closestPoint );
}

//

/**
  * Get the closest point in a line to a box. Returns the calculated point.
  * The box and the line remain unchanged. Only for 1D to 3D
  *
  * @param { Array } srcLine - Source line.
  * @param { Array } srcBox - Source box.
  *
  * @example
  * // returns 0;
  * _.boxClosestPoint( [ 0, 0, 0, 2, 2, 2 ] , [ 0, 0, 0, 1, 1, 1 ]);
  *
  * @example
  * // returns [ 0, - 1, 0 ];
  * _.boxClosestPoint( [ 0, - 1, 0, 0, -2, 0 ] , [ 2, 2, 2, 2, 2, 2 ]);
  *
  * @returns { Number } Returns the closest point in the line to the box.
  * @function boxClosestPoint
  * @throws { Error } An Error if ( arguments.length ) is different than two or three.
  * @throws { Error } An Error if ( srcLine ) is not line.
  * @throws { Error } An Error if ( srcBox ) is not box.
  * @throws { Error } An Error if ( dim ) is different than box.dimGet (the line and box don´t have the same dimension).
  * @memberof wTools.line
  */
function boxClosestPoint( srcLine, srcBox, dstPoint )
{
  _.assert( arguments.length === 2 || arguments.length === 3 , 'expects two or three arguments' );

  if( arguments.length === 2 )
  dstPoint = _.array.makeArrayOfLength( srcBox.length / 2 );

  if( dstPoint === null || dstPoint === undefined )
  throw _.err( 'Not a valid destination point' );

  if( srcLine === null )
  srcLine = _.line.make( srcBox.length / 2 );

  let srcLineView = _.line._from( srcLine );
  let origin = _.line.originGet( srcLineView );
  let direction = _.line.directionGet( srcLineView );
  let dimLine  = _.line.dimGet( srcLineView )

  let boxView = _.box._from( srcBox );
  let dimBox = _.box.dimGet( boxView );
  let min = _.vector.from( _.box.cornerLeftGet( boxView ) );
  let max = _.vector.from( _.box.cornerRightGet( boxView ) );

  let dstPointView = _.vector.from( dstPoint );
  _.assert( dimLine === dimBox );

  if( _.line.boxIntersects( srcLineView, boxView ) )
  return 0;

  /* box corners */
  let c = _.box.cornersGet( boxView );

  let distance = _.box.pointDistance( boxView, origin );
  let d = 0;
  let pointView = _.vector.from( origin );

  for( let j = 0 ; j < _.Space.dimsOf( c )[ 1 ] ; j++ )
  {
    let corner = c.colVectorGet( j );
    d = Math.abs( _.line.pointDistance( srcLineView, corner ) );
    if( d < distance )
    {
      distance = d;
      pointView = _.line.pointClosestPoint( srcLineView, corner );
    }
  }

  pointView = _.vector.from( pointView );
  for( let i = 0; i < pointView.length; i++ )
  {
    dstPointView.eSet( i, pointView.eGet( i ) );
  }

  return dstPoint;
}




// --
// define class
// --

let Proto =
{

  make : make,
  makeZero : makeZero,
  makeNil : makeNil,

  zero : zero,
  nil : nil,

  from : from,
  _from : _from,
  fromPair : fromPair, // fromPoints : fromPoints,

  is : is,
  dimGet : dimGet,
  originGet : originGet,
  directionGet : directionGet,

  lineAt : lineAt,
  getFactor : getFactor,

  lineParallel3D : lineParallel3D,
  lineParallel : lineParallel,
  lineIntersectionFactors : lineIntersectionFactors,
  lineIntersectionPoints : lineIntersectionPoints,
  lineIntersectionPoint : lineIntersectionPoint,
  lineIntersectionPointAccurate : lineIntersectionPointAccurate,
  lineIntersects : lineIntersects,

  lineDistance : lineDistance,
  lineClosestPoint : lineClosestPoint,

  pointContains : pointContains,
  pointDistance : pointDistance,
  pointClosestPoint : pointClosestPoint,

  boxIntersects : boxIntersects,
  boxDistance : boxDistance,
  boxClosestPoint : boxClosestPoint,
}

_.mapSupplement( Self, Proto );

//

if( typeof module !== 'undefined' )
{

  require( './Sphere.s' );

}

})();
