import React from "react";
import { Route, Routes, Link } from "react-router-dom";
import { Box, Button, Typography } from "@mui/material";
import Dashboard from "./dashboard/Dashboard";
import Nav from "./nav/Nav";
import HouseProfile from "./houseProfile/HouseProfile";
import UserProfile from "./userProfile/UserProfile";

const AdminContainer = () => {
  return (
    <Box>
      <Button color='inherit' component={Link} to='/'>
        <Typography>selection menu</Typography>
      </Button>
      <Box>
        <Nav />
        <Routes>
          <Route path='/' element={<Dashboard />}></Route>
          {/* <Route
            path='houseprofile/:hid/'
            element={<HouseProfile />}
          ></Route> */}
          <Route path='houseprofile/:hid' element={<HouseProfile />}></Route>
          <Route path='userprofile/:uid' element={<UserProfile />}></Route>
        </Routes>
        {/* <Footer /> */}
      </Box>
    </Box>
  );
};

export default AdminContainer;
