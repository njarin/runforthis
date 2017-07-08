class Office extends React.Component {

  render() {
    const legislator = this.props.office.legislator
    const district = `${this.props.office.district.state} ${this.props.office.district.name}`
    const organizations = this.props.office.resources
    return (
      <div className="office-component">
        <h2>
          {district}
        </h2>
        <p>
          Next Election: {legislator.term_end}
        </p>
        <p>
          Incumbent: <a href={legislator.website} target="_blank">{legislator.title} {legislator.full_name}</a>
        </p>
        <p>Here's some resources that may be able to help you run:</p>
        <ul>
          {organizations.map((org) => { return(<Resource organization = {org} /> )})}
        </ul>
      </div>
    )
  }
};
