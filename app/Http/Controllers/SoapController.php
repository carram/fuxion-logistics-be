<?php

namespace FuxionLogistic\Http\Controllers;

use FuxionLogistic\Http\Soap\CargueMasivoServientrega;
use FuxionLogistic\Http\Soap\PruebaMultiplicacion;
use FuxionLogistic\Http\Soap\Xml;
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
        $params_body = [
            'CargueMasivoExterno'=>[
                'envios'=>[
                    'CargueMasivoExternoDTO'=>[
                        'objEnvios'=>[
                            'EnviosExterno'=>[
                                'Num_Guia'=>'0',
                                'Num_Sobreporte'=>'0',
                                'Doc_Relacionado'=>null,
                                'Num_Piezas'=>'1',
                                'Des_TipoTrayecto'=>'1',
                                'Ide_Producto'=>'2',
                                'Des_FormaPago'=>'2',
                                'Des_MedioTransporte'=>'1',
                                'Num_PesoTotal'=>'3',
                                'Num_ValorDeclaradoTotal'=>'5500',
                                'Num_VolumenTotal'=>'0',
                                'Num_BolsaSeguridad'=>'0',
                                'Num_Precinto'=>'0',
                                'Des_TipoDuracionTrayecto'=>'1',
                                'Des_Telefono'=>'3209179277',
                                'Des_Ciudad'=>'Popayan',
                                'Des_Direccion'=>'Carrera 33 #4-84',
                                'Nom_Contacto'=>'Jose Luis',
                                'Des_VlrCampoPersonalizado1'=>null,
                                'Num_ValorLiquidado'=>'0',
                                'Des_DiceContener'=>'Indumentaria',
                                'Des_TipoGuia'=>'1',
                                'Num_VlrSobreflete'=>'0',
                                'Num_VlrFlete'=>'0',
                                'Num_Descuento'=>'0',
                                'idePaisOrigen'=>'1',
                                'idePaisDestino'=>'1',
                                'Des_IdArchivoOrigen'=>null,
                                'Des_DireccionRemitente'=>null,
                                'Num_PesoFacturado'=>'0',
                                'Est_CanalMayorista'=>false,
                                'Num_IdentiRemitente'=>null,
                                'Num_TelefonoRemitente'=>null,
                                'Num_Alto'=>'1',
                                'Num_Ancho'=>'1',
                                'Num_Largo'=>'1',
                                'Des_DepartamentoDestino'=>'Cauca',
                                'Des_DepartamentoOrigen'=>'Cundinamarca',
                                'Gen_Cajaporte'=>false,
                                'Gen_Sobreporte'=>false,
                                'Nom_UnidadEmpaque'=>'GENERICA',
                                'Nom_RemitenteCanal'=>null,
                                'Des_UnidadLongitud'=>'cm',
                                'Des_UnidadPeso'=>'kg',
                                'Num_ValorDeclaradoSobreTotal'=>'0',
                                'Num_Factura'=>'FAC-00001',
                                'Des_CorreoElectronico'=>'jlcapote@misena.ecu.co',

                                'Ide_Destinatarios'=>'00000000-0000-0000-0000-000000000000',
                                'Ide_Manifiesto'=>'00000000-0000-0000-0000-000000000000',
                                'Est_EnviarCorreo'=>false,
                            ]
                        ]
                    ]
                ]
            ]
        ];
        $servicio = 'http://web.servientrega.com:8081/GeneracionGuias.asmx?WSDL';
        /*$head = [
                'login'=>'Luis1937',
                'pwd'=>'MZR0zNqnI/KplFlYXiFk7m8/G/Iqxb3O',
                'Id_CodFacturacion'=>'SER408',
                'Nombre_Cargue'=>'INTEGRACION INFO_CLIENTE'
        ];
        $xml_head = new \SimpleXMLElement('<AuthHeader/>');

        Xml::array_to_xml($head,$xml_head);
*/
        $client = new \nusoap_client($servicio, true);
        $client->soap_defencoding = 'UTF-8';
        $client->decode_utf8 = FALSE;
        $client->setHeaders('<AuthHeader>
                                 <login>Luis1937</login>
                                 <pwd>MZR0zNqnI/KplFlYXiFk7m8/G/Iqxb3O</pwd>
                                 <Id_CodFacturacion>SER408</Id_CodFacturacion>
                                 <Nombre_Cargue>INTEGRACION INFO_CLIENTE</Nombre_Cargue>
                              </AuthHeader>
                        ');


        // Calls
        $result = $client->call('CargueMasivoExterno', $params_body);
        if ($client->fault) {
            echo $msg = "Retorno Fault: " . $client->faultstring . "<br>";
        }

        $err = $client->getError();
        if ($err) {
            echo $msg = "Retorno Error:" . $err . " <br>";
        }
        dd($result);

       /* //$client = new \SoapClient($servicio,$params);
        //$result = $client->CargueMasivoExterno($params);

        /*$aHTTP['http']['header'] =  "User-Agent: PHP-SOAP/5.5.11\r\n";

        $aHTTP['http']['header'].= "login: luis\r\n"."pwd: 123\r\n"."Id_CodFacturacion: 154\r\n"."Nombre_Cargue: 1232";

        $context = stream_context_create($aHTTP);

        $client=new \SoapClient($servicio,array());

        $auth = array(
            'login'=>'Luis1937',
            'pwd'=>'MZR0zNqnI/KplFlYXiFk7m8/G/Iqxb3O',
            'Id_CodFacturacion'=> 'SER408',
            'Nombre_Cargue'=> 'INTEGRACION INFO_CLIENTE',
        );
        //$header = new \SoapHeader('tem','AuthHeader',$auth,false);;
        //$client->__setSoapHeaders($header);

        //$result = $client->CargueMasivoExterno();
        //var_dump($result);
        //dd($result);

        /*$xml = new \SimpleXMLElement('<Header/>');
        $header = ['tem:AuthHeader'=>
                    [
                        'tem:login'=>'',
                        'tem:pwd'=>'',
                        'tem:Id_CodFacturacion'=>'',
                        'tem:Nombre_Cargue'=>''
                    ]
                ];
        Xml::array_to_xml($header,$xml);
        $this->soapWrapper->add('servientrega', function ($service) use($header) {
            $service
                ->wsdl('http://web.servientrega.com:8081/GeneracionGuias.asmx?WSDL')
                ->trace(false)
                ->classMap([
                    CargueMasivoServientrega::class,
                ])
                ->options([$header]);
        });

        $cargue_masivo = [
            'nsl:envios'=>[
                'nsl:CargueMasivoExternoDTO'=>[
                    'nsl:objEnvios'=>[
                        'nsl:EnviosExterno'=>[
                            'nsl:Num_Guia'=>'0'
                        ]
                    ]
                ]
            ]
        ];

        $xml = new \SimpleXMLElement('<CargueMasivoExterno/>');

        Xml::array_to_xml($cargue_masivo,$xml);

        $response = $this->soapWrapper->call('servientrega.CargueMasivoExterno',[
            //new CargueMasivoServientrega($cargue_masivo)
        ]);

        var_dump($response);*/
        $servicio = 'http://web.servientrega.com:8081/GeneracionGuias.asmx?WSDL';
        $params = [
            'location'=>'http://web.servientrega.com:8081/GeneracionGuias.asmx?WSDL',
            'uri'=>'http://web.servientrega.com:8081/GeneracionGuias.asmx?WSDL',
            'trace'=>1
        ];

        $client = new \SoapClient($servicio,$params);
        $auth_params = new \stdClass();
        $auth_params->login = 'Luis1937';
        $auth_params->pwd = 'MZR0zNqnI/KplFlYXiFk7m8/G/Iqxb3O';
        $auth_params->Id_CodFacturacion = 'SER408';
        $auth_params->Nombre_Cargue = 'INTEGRACION INFO_CLIENTE';

        $header_params = new \SoapVar($auth_params,SOAP_ENC_OBJECT);
        $header = new \SoapHeader('http://microsoft.com/wsdl/types/','AuthHeader',$header_params,false);
        $client->__setSoapHeaders([$header]);

        $response = $client->__call('CargueMasivoExterno',$params_body);
        dd($response);
    }
}