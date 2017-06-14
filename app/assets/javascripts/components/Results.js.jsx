class Results extends React.Component {

  render() {
    console.log(this.props.offices)
    return (
      <div className="results-page">
        <NavBar />
        <div>
          Here are your results:
          {this.props.offices.map((office, index) => {
            return(<Office office={office} key={index}/>)
          })}
        </div>
      </div>
    )
  }
};
