import {Component} from 'react';

class PropNode extends Component{

    render(){
        return(
            <div style={{padding:"0px"}}>
                {this.props.children}
            </div>
        )
    }
}

export default PropNode;