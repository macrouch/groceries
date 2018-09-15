import React from 'react';
import { ListGroup } from 'reactstrap';
import Item from './Item';
import ItemForm from './ItemForm';

class List extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      neededItems: [],
      availableItems: [],
    };
  }

  getToken() {
    return $('meta[name="csrf-token"]').attr('content');
  }

  componentDidMount() {
    fetch('/get_items')
    .then((response) => response.json())
    .then((data) => {
      this.setState({
        neededItems: data.needed,
        availableItems: data.available,
      });
    });
  }

  handleAdd(item) {
    fetch('/add_item', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': this.getToken(),
      },
      body: JSON.stringify({
        item: {
          name: item.name,
          quantity: item.quantity,
        },
      }),
    })
    .then((response) => response.json())
    .then((data) => {
      this.setState({
        neededItems: data.needed,
        availableItems: data.available,
      });
    });
  }

  handleRemove(item) {
    fetch('/remove_item', {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': this.getToken(),
      },
      body: JSON.stringify({
        item: {
          id: item.id,
        },
      }),
    })
    .then((response) => response.json())
    .then((data) => {
      this.setState({
        neededItems: data.needed,
        availableItems: data.available,
      });
    });
  }

  renderItem(item, index) {
    return (
      <Item
        name={item.name}
        quantity={item.quantity}
        key={index}
        onClick={() => this.handleRemove(item)}
      />
    );
  }

  render() {
    return (
      <div className="">
        <hr />
        <ItemForm
          addItem={item => this.handleAdd(item)}
          availableItems={this.state.availableItems}
        />
        <hr />
        <ListGroup>
          {this.state.neededItems.map((item, index) => (
            this.renderItem(item, index)
          ))}
        </ListGroup>
      </div>
    );
  }
}

export default List;
