
import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import "react-app-polyfill/ie11";
import "react-app-polyfill/stable";

import "react-app-polyfill/ie11";
import "react-app-polyfill/stable";
import "react-datepicker/dist/react-datepicker.css";

import "highlight.js/styles/googlecode.css";
import "perfect-scrollbar/css/perfect-scrollbar.css";

import * as _redux from '../src/redux';
import store, { persistor } from '../src/redux/store';
import App from '../src/app/App';

import "../src/_metronic/_assets/plugins/keenthemes-icons/font/ki.css";
import '../src/_metronic/_assets/plugins/flaticon/flaticon.css';
import '../src/_metronic/_assets/plugins/flaticon2/flaticon.css';

import {
  MetronicLayoutProvider,
  MetronicSplashScreenProvider,
  MetronicSubheaderProvider
} from "../src/_metronic/layout";
import {MetronicI18nProvider} from '../src/_metronic/i18n';

import "./metronic.scss";


class Metronic extends React.Component {
  render () {
    return (
        <MetronicI18nProvider>
          <MetronicLayoutProvider>
            <MetronicSubheaderProvider>
              <MetronicSplashScreenProvider>

                <App store={store} persistor={ persistor } />

              </MetronicSplashScreenProvider>
            </MetronicSubheaderProvider>
          </MetronicLayoutProvider>
        </MetronicI18nProvider>
    );
  }
}

export default Metronic
