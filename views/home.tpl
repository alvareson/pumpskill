<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/static/css/cover.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">

    <title>
        Проект
    </title>

</head>

<body>
    <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">

      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand">Банковская программа</h3>
        </div>
      </header>

      <main role="main" class="inner cover">

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Список клиентов</h5>
                <p class="card-text">Просмотер всех клиентов банка</p>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Открыть список клиентов</button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Список клиентов</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Имя</th>
                            <th scope="col">Фамилия</th>
                            <th scope="col">Займ</th>
                            </tr>
                        </thead>
                        <tbody>
                            % for client in clients:
                                <tr>
                                <th scope="row">{{ clients.index(client) + 1 }}</th>
                                <td>{{ client['name'] }}</td>
                                <td>{{ client['surname'] }}</td>
                                <td>{{ client['loan'] }}</td>
                                </tr>
                            % end

                        </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Закрыть</button>
                    </div>
                    </div>
                </div>
                </div>
            </div>
        </div>

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Проверить клиента</h5>
                <p class="card-text">Ввести Имя и Фамилию клиента, для проверки возможности выдачи кредита</p>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="">Имя и фамилия</span>
                    </div>
                    <form action="/" method="post">
                        <input name="name" type="text" class="form-control">
                        <input name="surname" type="text" class="form-control">
                        <input value="Проверить" type="submit" />
                    </form>
                    <button type="button" class="btn btn-outline-success">{{ ans['otvet'] }}</button>
                </div>
            </div>
        </div>

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Рассчитать кредит</h5>
                <p class="card-text">Рассчитать сумму ежемесячного платежа при кредите на год</p>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Считать</button>
                
                <!-- Modal -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Расчёт кредита сроком на 1 год</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="checkout">
                            <p class="price" data-price="12">Сумма кредита: 
                            <input type="text" class="quantity"> руб.
                            </p>
                            <p class="total">Рублей в месяц: <span id="total"></span></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Закрыть</button>
                    </div>
                    </div>
                </div>
                </div>

            </div>
        </div>
        
      </main>

      <footer class="mastfoot mt-auto">
        <div class="inner">
          <p align="center"><a href="https://pumpskill.ru/">Pumpskill</a></p>
        </div>
      </footer>

    </div>

    <script type="text/javascript" src="/static/js/jquery-3.2.1.slim.min.js"></script>
    <script type="text/javascript" src="/static/js/popper.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script>
    $(document).ready(function(){
        $(".checkout").on("keyup", ".quantity", function(){
            var price = +$(".price").data("price");
            var quantity = +$(this).val();
            $("#total").text(quantity / price + " руб.");
        })
    })
    </script>
</body>

</html>