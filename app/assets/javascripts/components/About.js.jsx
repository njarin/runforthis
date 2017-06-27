class About extends React.Component {

  render() {
    return (
      <div className="about-page">
        <NavBar />
        <div className="about-us-section">
          <div className="about-nick column">
            Nick Jarin is a web developer with a passion for politics and storytelling. When he isn't coding, you'll find him working on the <a href="http://nw-nerd.com/" target="_blank">NW NERD</a> podcast.
          </div>
          <div className="about-dan column">
            Dan McKeon uses his web developer skills for good, including his other projects like <a href="http://www.crconnect.org/" target="_blank">Cancer Research Connect</a>. When he isn't behind a keyboard, he prefers to be up on a mountain.
          </div>
        </div>
      </div>
    )
  }
};
