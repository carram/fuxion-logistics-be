<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
@section('css')
    <!-- Styles -->
        <link href="{{asset('css/helpers.css')}}" rel="stylesheet" type="text/css">
        <link href="{{asset('bootstrap-3.3.7-dist/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">

        <link href="{{asset('DataTables-1.10.15/media/css/jquery.dataTables.css')}}" rel="stylesheet" type="text/css">
        <link href="{{asset('css/global.css')}}" rel="stylesheet" type="text/css">

        <link href="{{url('kartik_v_bootstrap_fileinput/css/fileinput.min.css')}}" media="all" rel="stylesheet" type="text/css" />
    @show
</head>
<body id="body">
    <div id="app">
        <nav class="navbar navbar-default navbar-static-top header">
            @include('layouts.sections.nav_bar')
        </nav>

        @yield('content')
    </div>

    <input type="hidden" id="general_url" value="{{url('/')}}">
    <input type="hidden" id="general_token" value="{{csrf_token()}}">

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"></script>
    @section('js')
        <script src="https://use.fontawesome.com/a8d29b5cc4.js"></script>
        <script src="{{asset('js/blockUi.js')}}"></script>
        <script src="{{asset('js/numeric.js')}}"></script>
        <script src="{{asset('js/global.js')}}"></script>
        <script src="{{asset('js/params.js')}}"></script>
        <script src="{{asset('DataTables-1.10.15/media/js/jquery.dataTables.js')}}"></script>
        <script src="{{url('kartik_v_bootstrap_fileinput/js/plugins/piexif.min.js')}}" type="text/javascript"></script>
        <script src="{{url('kartik_v_bootstrap_fileinput/js/plugins/sortable.min.js')}}" type="text/javascript"></script>
        <script src="{{url('kartik_v_bootstrap_fileinput/js/plugins/purify.min.js')}}" type="text/javascript"></script>
        <script src="{{url('kartik_v_bootstrap_fileinput/js/fileinput.min.js')}}"></script>
        <script src="{{url('kartik_v_bootstrap_fileinput/js/locales/es.js')}}"></script>
    @show
</body>
</html>
