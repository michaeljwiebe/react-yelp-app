class ApiMaster extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      termSearch: "",
      locationSearch: "",
      businesses: []
    };
    this.setStateTerm = this.setStateTerm.bind(this);
    this.setStateLocation = this.setStateLocation.bind(this);
    this.runApi = this.runApi.bind(this);
  }
  render() {
    return (
      <div>
        <Header />
        <div className="inputs">
          <input
            placeholder="business-term"
            value={this.state.termSearch}
            onChange={this.setStateTerm}
          />
          <input
            placeholder="business-location"
            value={this.state.locationSearch}
            onChange={this.setStateLocation}
          />
          <button onClick={this.runApi}>Click Me!</button>
        </div>
        <CreateBusinessDivs results={this.state.businesses} />
      </div>
    );
  }
  setStateTerm(event) {
    this.setState({ termSearch: event.target.value });
  }
  setStateLocation(event) {
    this.setState({ locationSearch: event.target.value });
  }
  runApi() {
    axios
      .get("https://yelp-search.herokuapp.com/search", {
        params: {
          term: this.state.termSearch,
          location: this.state.locationSearch
        }
      })
      .then(
        function(response) {
          this.setState({ businesses: response.data.businesses });
        }.bind(this)
      )
      .catch(function(error) {
        console.log(error);
      });
  }
}

function Header() {
  return (
    <div className="header">
      <div className="headerText">Please Search For Your Business</div>
      <div className="produced">produced by MattLomet</div>
      <div className="yelpImage" />
    </div>
  );
}

function CreateBusinessDivs(props) {
  let businesses = props.results.map(function(business, index) {
    console.log(business);
    return (
      <div className="mainContainer" key={index}>
        <div className="businessTexts">
          <div className="businessName text">{business.name}</div>
          <div className="businessPhone text">{business.display_phone}</div>
          <div className="businessAdress text">{business.location.address}</div>
        </div>
        <div className="images">
          <img className="businessPicture" src={business.image_url} />
          <img className="businessRating" src={business.rating_img_url_large} />
        </div>
      </div>
    );
  });
  return (
    <div className="backContainer">
      <div>{businesses}</div>
    </div>
  );
}

ReactDOM.render(<ApiMaster />, document.getElementById("react"));
