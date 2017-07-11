class Resource extends React.Component {

  render() {
    const org = this.props.organization;
    return (
      <li key={org.id}>
        <a href={org.link} target="_blank">
          {org.name}
        </a>
      </li>
    )
  }
};
