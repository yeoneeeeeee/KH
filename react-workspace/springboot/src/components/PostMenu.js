import {useState} from 'react';
import axios from 'axios';

const PostMenu = () => {

    const [newMenu, setNewMenu] = useState({});

    const handleInputChange = (e) => {
        const {name, value} = e.target;
        setNewMenu({...newMenu, [name] : value});
    }

    const insertMenu = (e) => {
        e.preventDefault();
        // 유효성 검사 => 생략
        // 프록시 설정 전
        //axios.post("http://localhost:8082/springboot/menu" , newMenu , {
        
        // 프록시 설정 후
        axios.post("http://localhost:3000/springboot/menu" , newMenu , {
            headers: {'Content-Type' : 'application/json'}
        })
        .then( response => {
            console.log(response.data);
            const {msg} = response.data;
            alert(msg);
        })
        .catch(console.log)
        .finally( () => {
            setNewMenu({});
            e.target.reset();
        })
    }
   
    return(
        <>
        {console.log(newMenu)}
        <div className="menu-test">
        <h4>메뉴 등록하기(POST)</h4>
        <form id="menuEnrollFrm" onSubmit={insertMenu}>
            <input type="text" onChange={handleInputChange} name="restaurant" placeholder="음식점" className="form-control" />
            <br />
            <input type="text" onChange={handleInputChange} name="name" placeholder="메뉴" className="form-control" />
            <br />
            <input type="number" onChange={handleInputChange} name="price" placeholder="가격" className="form-control" />
            <br />
            <div className="form-check form-check-inline">
                <input type="radio" onChange={handleInputChange} name="type" id="post-kr" value="kr" />
                <label htmlFor="post-kr" className="form-check-label">한식</label>&nbsp;
                <input type="radio" onChange={handleInputChange} name="type" id="post-ch" value="ch"/>
                <label htmlFor="post-ch" className="form-check-label">중식</label>&nbsp;
                <input type="radio" onChange={handleInputChange} name="type" id="post-jp" value="jp"/>
                <label htmlFor="post-jp" className="form-check-label">일식</label>&nbsp;
            </div>
            <br />
            <div className="form-check form-check-inline">
                <input type="radio" onChange={handleInputChange} name="taste" id="post-hot" value="hot"/>
                <label htmlFor="post-hot" className="form-check-label">매운맛</label>&nbsp;
                <input type="radio" onChange={handleInputChange} name="taste" id="post-mild" value="mild"/>
                <label htmlFor="post-mild" className="form-check-label">순한맛</label>
            </div>
            <br />
            <input type="submit" className="btn btn-block btn-outline-success btn-send" value="등록" />
        </form>
    </div>
    </>
    );   
}

export default PostMenu;