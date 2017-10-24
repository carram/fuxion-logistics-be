<?php

namespace FuxionLogistic\Http\Controllers;

use FuxionLogistic\Http\Soap\PruebaMultiplicacion;
use Illuminate\Http\Request;
use Artisaninweb\SoapWrapper\SoapWrapper;
class SoapController extends Controller
{
    /**
     * @var SoapWrapper
     */
    protected $soapWrapper;

    /**
     * SoapController constructor.
     *
     * @param SoapWrapper $soapWrapper
     */
    public function __construct(SoapWrapper $soapWrapper)
    {
        $this->soapWrapper = $soapWrapper;
    }

    /**
     * Use the SoapWrapper
     */
    public function show()
    {
        $this->soapWrapper->add('calculator', function ($service) {
            $service
                ->wsdl('http://www.dneonline.com/calculator.asmx?WSDL')
                ->trace(true)
                ->classMap([
                    PruebaMultiplicacion::class,
                ]);
        });

        $response = $this->soapWrapper->call('calculator.Multiply',[
            new PruebaMultiplicacion(10,12)
        ]);

        dd($response);
    }
}