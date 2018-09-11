import React from 'react';
import { Button, Form, FormGroup, Input } from 'reactstrap';

class ItemForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      quantity: '',
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;

    this.setState({ [name]: value });
  }

  handleSubmit(event) {
    if (this.state.name != '') {
      this.props.addItem(this.state);
      this.setState({
        name: '',
        quantity: '',
      });
    }

    event.preventDefault();
  }

  render() {
    return (
      <Form onSubmit={this.handleSubmit}>
        <h5>Add new Item</h5>
        <FormGroup>
          <Input
            name="name"
            id="name"
            placeholder="Name"
            value={this.state.name}
            onChange={this.handleChange}
          />
        </FormGroup>
        <FormGroup>
          <Input
            name="quantity"
            id="quantity"
            placeholder="Quantity"
            value={this.state.quantity}
            onChange={this.handleChange}
          />
        </FormGroup>
        <FormGroup>
          <Button color="primary">Add Item</Button>
        </FormGroup>
      </Form>
    );
  }
}

export default ItemForm;
