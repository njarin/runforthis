class Search extends React.Component {

  constructor(){
    super();
    this.state = {
      // mode: fresh
    }
  }

  clickHandler(e) {
    console.log(e);
  }

  render() {
    return (
      <div className="search-page">
        <NavBar />
        <Mission onClick={(e) => this.clickHandler(e)}/>
        {/* <SearchForm /> */}
        <div className="search-form-target" />
      </div>
    )
  }
};
