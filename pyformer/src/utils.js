//捕捉后端信息
import axios from 'axios'

const path = 'http://127.0.0.1:5000';//本机
export function axGet(p){
  console.log(path + p);
  return axios.get(path + p)
}
export function axPost(p, d){
  console.log(path + p);
  return axios({method: 'post', url: path+p, data: d, })
}

