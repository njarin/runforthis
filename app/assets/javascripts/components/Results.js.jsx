class Results extends React.Component {

  render() {
    return (
      <div className="results-page">
        <NavBar />
        <div>
          Here are your results:
          <Office office={this.props.offices.rep1} />
          <Office office={this.props.offices.rep2} />
          <Office office={this.props.offices.sen} />
        </div>
      </div>
    )
  }
};
