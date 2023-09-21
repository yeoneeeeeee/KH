/*
    HOC(High-Order-Component) : 컴포넌트를 인자로 받거나, 반환하는 함수

    Hoc를 이용하면 여러 컴포넌트에서 동일하게 적용돼어야 하는 공통기능을
    코드 중복 없이 사용할수 있다
    ex) 로깅, id체크 
*/
import withLogging from './withLogging';

function Hoc(){

    return(
        <div>
            hoc..hoc..
        </div>
    )
}

export default withLogging(Hoc,'Hoc');