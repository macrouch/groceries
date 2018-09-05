import React from 'react';
import { ListGroup } from 'reactstrap';
import Item from './Item';
import ItemForm from './ItemForm';

class List extends React.Component {
  constructor(props) {
    super(props);

    this.state = { items: [] };
  }

  componentDidMount() {
    fetch('/get_items')
    .then((response) => response.json())
    .then((data) => {
      this.setState({ items: data });
    });
  }

  handleAdd(item) {
    var items = this.state.items.slice();
    items.push(item);

    // POST here
    items = items.sort((a, b) => a.name > b.name);
    this.setState({ items: items });
  }

  handleRemove(i) {
    var items = this.state.items.slice();
    items.splice(i, 1);

    // DELETE here
    this.setState({ items: items });
  }

  renderItem(item, index) {
    return (
      <Item
        name={item.name}
        quantity={item.quantity}
        key={index}
        onClick={() => this.handleRemove(index)}
      />
    );
  }

  render() {
    return (
      <div className="">
        <ItemForm addItem={item => this.handleAdd(item)} />
        <ListGroup>
          {this.state.items.map((item, index) => (
            this.renderItem(item, index)
          ))}
        </ListGroup>
      </div>
    );
  }
}

export default List;
