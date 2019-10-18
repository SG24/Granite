import React from "react";
const axios = require('axios');

class Login extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.onEmailChange = this.onEmailChange.bind(this);
    this.onPasswordChange = this.onPasswordChange.bind(this);
    this.state = {
      email: '',
      password: ''
    }
  }

  onEmailChange(event) {
    this.setState({ email: event.target.value });
  }

  onPasswordChange(event) {
    this.setState({ password: event.target.value });
  }

  handleSubmit() {
    let self = this;
    axios(
      {
        method: 'post',
        url: '/login',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': document.querySelector('[name="csrf-token"]').content
        },
        data: {
          email: self.state.email,
          password: self.state.password,
        }
      }).then((result) => {
        if (result.data.verified === "true") {
          window.location.replace("/");
        } else {
          alert("Incorrect Credentials");
        }

      }).catch((err) => {

      });;
  }

  render() {
    return (
      <div>
        <h1>Login</h1>
        <div className="row">
          <div className="col-md-6 col-md-offset-3">
            <div>
              <label>Email
                <input type="email" className="form-control" required onChange={this.onEmailChange} />
              </label>
            </div>
            <div>
              <label>Password
                <input type="password" className="form-control" onChange={this.onPasswordChange} />
              </label>
            </div>
            <button onClick={this.handleSubmit}>Submit</button>
          </div>
        </div>
      </div>
    );
  }
}

export default Login