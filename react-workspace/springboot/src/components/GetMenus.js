import { useState } from "react";
import axios from "axios";

const GetMenus = () => {
    const [menus, setMenus] = useState([]);

    /* 
        CORS정책 위반
        모든 브라우저는 기본적으로 동일한 출처(Origin)가 아닌 리소스 요청에 대해서는 전부 차단을함.
        (동일한 출처로만 요청을 보내는게 기본 규칙.)

        요청을 받는 서버에서 현재 들어욘 출처에 대해서는 요청을 허용하도록 응답헤더에
        Access-Control-Allow-Origin속성을 추가하면 CORS정책을 위반하지 않고 요청을 전달해줄수 있다.

        * Origin(출처) ? 프로토콜 + ip주소 + 포트번호
    */
    // 프록시 설정 전
    // const getMenus = () => {
    //     axios.get("http://localhost:8082/springboot/menus")
    //          .then( response => {
    //             setMenus(response.data);
    //          }).catch(console.log);
    // }

    // 프록시 설정 후
    /* 
        proxy? 현재 프론트서버로 들어오는 요청을 받아서, package.json에 설정한 프록시 설정값으로
               지정해둔 서버로 전달해주는 "중계자" 역할을 하는 객체.

               현재서버localhost:3000으로 들어오는 모든 요청을 proxy가 중간에 전달받아 localhost:8082
               서버로 대신 요청을 보내고, 응답결과도 대신 받아와서 현재 서버로 전달해줌.
    */
    const getMenus = () => {
        axios.get("http://localhost:3000/springboot/menus")
             .then( response => {
                setMenus(response.data);
             }).catch(console.log);
    }

    return(
        <>
        <div className="menu-test">
            <h4>전체메뉴조회(GET)</h4>
            <input type="button" onClick={getMenus} className="btn btn-block btn-outline-success btn-send" id="btn-menus" value="전송"/>
        </div>
        <div className="result" id="menus-result">
            <table className='table'>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>음식점</th>
                        <th>메뉴</th>
                        <th>가격</th>
                        <th>타입</th>
                        <th>맛</th>
                    </tr>
                </thead>
                <tbody>
                {
                    menus && menus.length > 0 && menus.map( (menu) => {
                        return (
                            <tr key={menu.id}>
                                <td>{menu.id}</td>
                                <td>{menu.restaurant}</td>
                                <td>{menu.name}</td>
                                <td>{menu.price}</td>
                                <td>{menu.type}</td>
                                <td>{menu.taste}</td>
                            </tr>
                        )
                    })
                }
                </tbody>
            </table>
        </div>
        </>
    )
}

export default GetMenus;