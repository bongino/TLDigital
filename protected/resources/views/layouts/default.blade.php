<!DOCTYPE html>
<html>
<head>
    @include('layouts.head')
</head>
<body>
<div id="wrapper">
    @include('layouts.header')
    @yield('content')
</div>
@include('layouts.footer')
</body>
</html>