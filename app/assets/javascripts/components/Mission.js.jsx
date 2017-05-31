class Mission extends React.Component {
  onClick(e) {
    e.preventDefault();
    console.log("We Made it!")
    this.props.onClick(e)
  }

  render() {
    return (
      <div className="mission-component container">
        <div className="mission-statement-wrapper">
          <p className="mission-statement">
            You should run for office! No, really! Local elected officials have a significant impact on your day-to-day life. About 33% of state-level legislators run unopposed. That’s a problem if you believe in democracy. Enter your address below and see what local offices are opening up near you and how you can run for those seats.
          </p>
        </div>
        <div className="quote">
          <p className="mission-quote">
            "If not us, who? If not now, when?"
          </p>
        </div>
        <button onClick={(e) => this.onClick(e)}>Learn More</button>
      </div>
    )
  }
};
