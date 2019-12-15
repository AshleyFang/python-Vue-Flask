import numpy as np
from flask import jsonify
from flask_cors import CORS
from models import app, db, User, Jingli, Guzhang, Fuwu
from flask import request

cors = CORS(app, resources={r"/getMsg": {"origins": "*"}})


@app.route('/')
def hello_world():
    return 'Welcome! —— FANG & TANG'


@app.route('/getUser', methods=['POST'])
def getUser():
    data = request.get_json(silent=True)
    account = data['account']
    user = User.query.get_or_404(int(account))
    if user:
        if user.pwd == data['pwd']:
            msg = user.account
        else:
            msg = 405
    else:
        msg = 404
    res = {
        "msg": msg
    }
    return jsonify(res)


@app.route('/getJingli', methods=['GET', 'POST'])   # /getJingli 是传递给前端的路径名
def getJingli():
    jinglis = Jingli.query.order_by(Jingli.id.desc()).all()
    res = {
        "msg": Jingli.repr(None, jinglis=jinglis)
    }
    return jsonify(res)


# delJingli 删除经理
@app.route("/delJingli", methods=['GET', 'POST'])
def delJingli():
    data = request.get_json(silent=True)  # {'id': 1}
    id = data['id']
    jingli = Jingli.query.get_or_404(int(id))
    db.session.delete(jingli)
    db.session.commit()
    res = {
        "msg": 200
    }
    return jsonify(res)


@app.route('/updateJingli', methods=['GET', 'POST'])
def updateJingli():
    data = request.get_json(silent=True)
    # print(data)
    id = data['id']
    jingli = Jingli.query.get_or_404(int(id))
    jingli.name = data['name']
    jingli.serviceArea = data["serviceArea"]

    # update
    db.session.add(jingli)
    db.session.commit()
    res = {
        "msg": 200
    }
    return jsonify(res)


@app.route('/addJingli', methods=['GET', 'POST'])
def addJingli():
    data = request.get_json(silent=True)
    # print(data)
    jingli = Jingli(
        name=data['name'],
        serviceArea=data["serviceArea"],
    )
    db.session.add(jingli)
    db.session.commit()

    res = {
        "msg": 200
    }
    return jsonify(res)


# 统计各工单每月数量
def countGongdans(gongdans, count=None):
    if count is None:
        count = [0 for i in range(12)]
    for g in gongdans:
        i = g.startTime.month - 1
        count[i] += 1
    return count


@app.route('/analyze', methods=['GET', 'POST'])
def analyze():
    data = request.get_json(silent=True)
    jingli = Jingli.query.get_or_404(data['id'])

    # 统计各工单每月数量
    count_guz = countGongdans(jingli.guzhangs)
    count_fuw = countGongdans(jingli.fuwus)
    print(count_guz, count_fuw)

    # 统计故障工单每个分类比例
    pie = {}
    for g in jingli.guzhangs:
        yiji = g.fenlei
        pie[yiji] = pie.get(yiji, 0) + 1
    pie2 = [{'name': k, 'value': round(v / len(jingli.guzhangs), 2)} for k, v in pie.items()]

    # 发送信息
    msg = {
      'bar': {
        'x': [str(i+1)+'月' for i in range(12)],
        'legend': ['故障工单', '非故障工单'],
        'y': [count_guz, count_fuw],
      }, 'pie': pie2
    }
    res = {
        "msg": msg
    }
    return jsonify(res)


# 启动运行
if __name__ == '__main__':
    # app.run()   # 这样子会直t接运行在本地服务器，也即是 localhost:5000
    app.run(host='0.0.0.0', port=5000)  # 这里可通过 host 指定在公网IP上运行
