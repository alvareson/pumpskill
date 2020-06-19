from bottle import run, route, template, static_file, get, post, request, delete


clients = [{'name': 'Ivan', 'surname': 'Ivanov', 'loan': 'Yes'},
           {'name': 'Vladimir', 'surname': 'Putin', 'loan': 'No'},
           {'name': 'Olga', 'surname': 'Buzova', 'loan': 'Yes'}]


@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static/')


@route('/', method='GET')
def index():
    ans = {'otvet': 'Введите имя/фамилию'}
    return template('home.tpl', {'clients': clients, 'ans': ans})


@route('/', method='POST')
def check():
    name = request.forms.get('name')
    surname = request.forms.get('surname')
    ans = {'otvet': 'Введите имя/фамилию'}
    for client in clients:
        if client['name'] == name and client['surname'] == surname:
            if client['loan'] == 'Yes':
                ans = {'otvet': 'Можно выдавать кредит'}
                break
            elif client['loan'] == 'No':
                ans = {'otvet': 'Нельзя давать кредит'}
                break
        else:
            ans = {'otvet': 'Данного клиента нету в БД'}
    return template('home.tpl', {'clients': clients, 'ans': ans})

run(host='127.0.0.1', port=8080, debug=True, reloader='True')