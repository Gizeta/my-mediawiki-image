<?php

namespace SemanticDuration;

use SMWNumberValue as NumberValue;

class DurationValue extends NumberValue {
  const TYPE_ID = '___duration';
  const TYPE_LABEL = '时长型';

  public function __construct( $typeid = '' ) {
    parent::__construct( self::TYPE_ID );
  }

  protected function parseUserValue( $value ) {
    if ( !is_string( $value )) {
      throw new InvalidArgumentException( '$value needs to be a string');
    }

    $num = 0;
    $arr = explode( ':', $value );
    if ( count( $arr ) == 3 ) {
      $num = $arr[0] * 3600 + $arr[1] * 60 + $arr[2];
    } elseif ( count( $arr ) == 2 ) {
      $num = $arr[0] * 60 + $arr[1];
    } else {
      $num = $arr[0];
    }

    return parent::parseUserValue( strval( $num ) );
  }

  public function getWikiValue() {
    if ( !$this->isValid() ) {
      return '';
    }

    $dur = $this->m_dataitem->getNumber();
    return $this->num2time( $dur );
  }

  public function getShortWikiText( $linker = null ) {
    return $this->getWikiValue();
  }

  public function getShortHTMLText( $linker = null ) {
    return $this->getShortWikiText( $linker );
  }

  public function getLongWikiText( $linked = null ) {
    return $this->getShortWikiText( $linker );
  }

  public function getLongHTMLText( $linker = null ) {
    return $this->getLongWikiText( $linker );
  }

  private function num2time( $dur = 0 ) {
    $sec = $dur % 60;
    $min = floor( ( $dur - $sec ) / 60 ) % 60;
    $hour = floor( ( $dur - $min * 60 - $sec ) / 3600 );

    return ( $hour > 0 ? strval( $hour ) . ':' : '' ) .
           ( $hour > 0 ? str_pad( $min, 2, '0', STR_PAD_LEFT ) : strval( $min ) ) . ':' .
           str_pad( $sec, 2, '0', STR_PAD_LEFT );
  }
}
