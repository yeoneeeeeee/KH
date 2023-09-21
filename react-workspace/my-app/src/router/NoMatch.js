import {Link} from 'react-router-dom';
/*
    찾고자 하는 url이 경로상에 존재하지 않을경우 대신 보여지게도리 컴포넌트
*/
function NoMatch(){
    return(
        <div>
            <h1>존재하지 않는 페이지입니다</h1>
            <Link to={"/"}>사이트로 돌아가기</Link>
        </div>
    )
}
export default NoMatch;