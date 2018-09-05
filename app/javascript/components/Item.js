import React from 'react';
import { ListGroupItem } from 'reactstrap';

class Item extends React.Component {
  render() {
    var quantity = '';
    if (this.props.quantity != '') {
      quantity = ' (' + this.props.quantity + ')';
    }

    return (
      <ListGroupItem onClick={this.props.onClick}>
        {this.props.name}
        {quantity}
      </ListGroupItem>

      // add modal here?
    );
  }
}

export default Item;
