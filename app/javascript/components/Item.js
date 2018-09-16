import React from 'react';
import { Button, Card, CardBody, CardHeader, Collapse, Form, FormGroup, Input } from 'reactstrap';

class Item extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: props.id,
      newQuantity: props.quantity,
      collapse: false,
    };

    this.toggle = this.toggle.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleRemove = this.handleRemove.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  toggle() {
    this.setState({ collapse: !this.state.collapse });
  }

  handleChange(event) {
    const target = event.target;
    const value = target.value;
    this.setState({ newQuantity: value });
  }

  handleRemove() {
    this.toggle();
    this.props.onRemove();
  }

  handleSubmit(event) {
    if (this.state.name != '') {
      this.props.onUpdate(this.state);
      this.toggle();
    }

    event.preventDefault();
  }

  render() {
    var quantity = '';
    if (this.props.quantity != '') {
      quantity = ' (' + this.props.quantity + ')';
    }

    return (
      <Card>
        <CardHeader onClick={this.toggle} style={{ cursor: 'pointer' }}>
          {this.props.name}
          {quantity}
        </CardHeader>
        <Collapse isOpen={this.state.collapse}>
          <CardBody>
            <Form onSubmit={this.handleSubmit}>
              <FormGroup>
                <Input
                  name="quantity"
                  id="quantity"
                  placeholder="Quantity"
                  value={this.state.newQuantity}
                  onChange={this.handleChange}
                />
              </FormGroup>
              <FormGroup>
                <Button color="primary">Update Item</Button>
              </FormGroup>
            </Form>

            <Button onClick={this.handleRemove} color='danger'>Remove Item</Button>
          </CardBody>
        </Collapse>
      </Card>
    );
  }
}

export default Item;
