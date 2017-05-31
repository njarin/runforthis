class Search extends React.Component {

  constructor(){
    super();
    this.state = {
      mode: fresh
    }
  }

  clickHandler(e) {
      
  }

  render() {
    return (
      <div className="search-page">
        <NavBar />
        <Mission />
        {/* <SearchForm /> */}
        <div className="search-form-target" />
      </div>
    )
  }
};
